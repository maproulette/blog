---
title: Using Overpass to create Challenges
date: 2020-12-15T08:44:17-08:00
updated: 2020-12-15T08:44:47-08:00
author: Martijn
category: Tutorial
---

*This post also appears on the [MapRoulette
Learn](https://learn.maproulette.org/) web site. You will find many more
resources there to get the most out of MapRoulette, including how-tos,
screencasts and reference documentation.*

Overpass is a powerful query language for OSM. You can ask it things
like “Show me all water fountains in Rome” or “Show me banks that are
more than 1km away from a police station”.

You can use Overpass queries directly in MapRoulette to generate tasks
when you create a new Challenge. In this post, I want to help you do
this, and avoid common mistakes.

## A simple example

Imagine that you want to create a Challenge to have mappers look at bus
stop nodes in a certain area. [This Overpass
query](http://overpass-turbo.eu/s/Wh4) will give you
all `highway=bus_stop` nodes in Salt Lake City:

```overpassql
area[name="Salt Lake City"]->.a;
node[highway=bus_stop](area.a);
out meta;
```

Explaining the full syntax of Overpass QL (the language this query is
written in) is outside the scope of this article. Please look at
the [language reference](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL),
[examples](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_API_by_Example)
and other Overpass related pages on the OSM wiki. OSM user Binette also has
some [MapRoulette specific query examples](https://wiki.openstreetmap.org/wiki/User:Binnette/OverpassQueries)
on their user page.

You can plug this query right into MapRoulette when you create a
Challenge:

<figure>
{% picture images/overpass_challenge_create.png %}
</figure>

After completing the Challenge wizard, your Tasks will reflect the
result of the Overpass Query:

<figure>
{% picture images/overpass_challenge_details.png %}
</figure>

## Common Pitfalls

### Define an area

Overpass queries span the entire map, unless you [specify an
area](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#By_area_.28area.29) to
limit the query to. Queries that do not specify an area can generate
huge results and take a long time to complete. Unless you really know
what you are doing, please specify an area to limit your query to.

### Don’t Use Overpass Turbo Extensions

Overpass Turbo lets you test Overpass queries, share them, and download
results in a variety of formats. It also offers a wizard that helps you
with common queries. We highly recommend using Overpass Turbo to test
your queries before you use them in MapRoulette.

Overpass Turbo uses a few language extensions that are not part of
Overpass QL. MapRoulette does not understand these extensions, so you
cannot use them in MapRoulette to generate tasks.

The most common extension Overpass Turbo uses is `<<bbox>>`. This
indicates the currently visible map extent. Overpass Turbo replaces this
with the actual longitude / latitude bounds before sending the query to
Overpass. If you want to use a query that contains, you need to
select Export \> Query \> Copy as standalone querybefore pasting into
MapRoulette.

### Beware of Recursions

Overpass lets you use recursion (`>`) to select all nodes belonging to a
way, or all nodes and ways belonging to a relation. If you use recursion
in a query to create Tasks in MapRoulette, you will often get more
results than you expected. This is because MapRoulette will interpret
each separate node as a Task, as well as the Way itself. To avoid this,
use `out geom`. So instead of…

```overpassql
way["highway"="path"](40.76,-111.90,40.81,-111.85);
out body;
>;
out skel qt;
```

… do this:

```overpassql
way["highway"="path"](40.76,-111.90,40.81,-111.85);
out geom;
```

### Timeouts

Complex queries or queries that span a large area can take a long time
to complete. MapRoulette uses a default query timeout of 180 seconds (3
minutes). This should be enough for most scenarios. If you really need
MapRoulette to tell Overpass to wait longer, you can use [Overpass’s
native `[timeout]` setting](https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL#timeout:) to
override this.

### A word on `out meta`

Strictly speaking, you don’t need all OSM metadata to build the tasks.
You can just use the `out` statement with no parameters which, according
to the documentation, gives you “all information necessary to use the
data”. By using `out meta` you get “everything output by body for each
OSM element, as well as the version, changeset id, timestamp, and the
user data of the user that last touched”.

<figure>
{% picture images/tiger_feature_properties.png %}
</figure>
