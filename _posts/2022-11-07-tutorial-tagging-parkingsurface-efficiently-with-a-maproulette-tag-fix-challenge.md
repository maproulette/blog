---
title: "Tutorial: tagging parking=surface efficiently with a MapRoulette Tag-Fix Challenge"
date: 2022-11-07T12:31:05-08:00
author: Martijn
category: Tutorial
---

Americans love cars. More than 90% of households own one, more than 20%
of households own 3 or more. Cars stand still most of the time and for
that, we need huge amounts of parking.

<figure>
{% picture images/parking_lot.jpg --alt picture of parked cars %}
</figure>

*Image source: [Flickr Commons](https://flic.kr/p/6VupPK)*

The simplest way to map a parking area in OSM is to draw an area and
mark it `amenity=parking`. It will then show up on the map as a grey
area with a blue “P”. In the United States, almost a million areas exist
with the `amenity=parking` tag.

<figure>
{% picture images/parking_osm.png --alt parking lot in rendered OSM map %}
</figure>

For more detail, you can add the `parking=*` tag to indicate what kind
of parking area it is. Common values are `surface`, `multi-storey` and
`street_side`. However, [less than
37%](https://taginfo.geofabrik.de/north-america/us/tags/amenity=parking#combinations)
of all parking areas in the United States have a `parking=*` tag. In
this tutorial, I will show you how to create a MapRoulette Challenge for
your area that lets mappers confirm that a parking area is `surface`
parking or not. We will do this using the Overpass API, JOSM, the
MapRoulette CLI tool, and MapRoulette itself.

## Finding your area of interest relation

First, to get the right input for the overpass query, we need an area to
work with. You could use a bounding box or an area relation. In this
example, I will use the relation for Houston, Texas. I look the relation
id up using the OSM website:

<figure>
{% picture images/houston_texas_osm.png --alt Houston Texas boundary relation on osm.org %}
</figure>

Note down the relation id, in my case `2688911`.

## Get parking area data in JOSM

Next we fire up JOSM to load the existing parking areas for Houston. We
use the following Overpass query:

```overpassql
rel(2688911);map_to_area->.houston;
way[amenity=parking][!parking](area.houston)(if:length()>200);
out;(._;>;);out meta;
```

This gives us all areas that are marked with `amenity=parking` but don’t
have any `parking=*` tag. We filter out small areas by specifying a
minimum perimeter length of 200 meters.

<figure>
{% picture images/houston_osm_parking.jpg --alt parking areas in JOSM %}
</figure>

Make sure you load this data into a new JOSM layer with no other data in
it.

## Making the tag changes in JOSM

Next, we select all the ways by using the search function in JOSM and
specifying `type:way` as the search parameter. We then add
`parking=surface` to all of these ways. This change will be the tag
suggestion in our MapRoulette task later.

<figure>
{% picture images/houston_parking_tag_change.png --alt tag changes being made in JOSM %}
</figure>

Save the layer as a JOSM data file.

## Create the MapRoulette JSON with `mr-cli`

The `mr-cli` tool is designed to take an OSMChange / JOSM change file
and create MapRoulette Tag Fix or Cooperative tasks from it. You can
install it with `npm`. You can find more information about the tool [on
its github page](https://github.com/maproulette/mr-cli).

We use the following command to create the tag-fix challenge:

`mr coop tag --out parking_houston.json parking_houston.osm`

<figure>
{% picture images/parking_houston_mrcli.png --alt mr-cli processing the OSM data %}
</figure>

This will take our newly created modified OSM data `parking_houston.osm`
and process all tag changes into a JSON file with MapRoulette tag-fix
tasks.

## Creating the Challenge

In MapRoulette, we open the “Create and Manage” area to create our new
Challenge. We add an appropriate name, description and instructions. We
select the JSON we just created as the task source. Also don’t forget to
add an appropriate changeset comment, and select a good aerial imagery
layer so mappers can see the current reality on the ground and make a
decision.

## Result

[This is the MapRoulette
Challenge](https://maproulette.org/browse/challenges/29854) we just
created!

<figure>
{% picture images/houston_parking_task.png --alt an example task in MapRoulette %}
</figure>

If you want to create a similar challenge for your city or area, you can
follow these instructions and just replace the relation id with the
appropriate one.

Happy Mapping!
