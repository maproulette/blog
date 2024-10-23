---
title: Adding directionality to stop signs in MapRoulette
date: 2020-12-03T12:11:05-08:00
author: Martijn
category: Challenge
---

The `highway=stop` tag [is the OSM
representation](https://wiki.openstreetmap.org/wiki/Tag:highway%3Dstop)
for a stop sign like this:

<figure>
{% picture images/stop_sign.jpg %}
<figcaption>A stop sign. Source: Wikipedia</figcaption>
</figure>

They are often placed on the intersection node of two ways, if there is
a stop sign in all directions (a four-way stop). There are plenty of
situations where the an intersection only has a stop sign in certain
directions. In that case, the stop sign node is often placed on the way
at the approximate location ahead of the intersection where the stop
sign is placed:

<figure>
{% picture images/stop_two_way.png %}
<figcaption>Stop signs placed before an intersection. Source: OSM
wiki</figcaption>
</figure>

In those cases, to make the tag unambiguous, it is recommended to add a
`direction` tag to the node, to define in which direction the sign
faces, relative to the directionality of the OSM way, as defined by the
ordering of the nodes that make up the way: either `forward` or
`backward` as illustrated here:

<figure>
{% picture images/stop_directions_in_id_editor.png %}
<figcaption>Detailed illustration of placement and tagging of
directional stop sign tagging in OSM. Source: OSM Wiki.</figcaption>
</figure>

However, the `direction` tags are often missing in OSM, making the tag
ambiguous. When we recently asked for ideas for new MapRoulette
Challenges on Twitter, fixing this was one of the suggestions!

<blockquote>
<p>How about adding "direction" to stop signs?</p>
<p>— Matthew Darwin (@matthewdarwin) <a
href="https://twitter.com/matthewdarwin/status/1333898112604188672">December
1, 2020</a></p>
</blockquote>

It didn’t take long for the MapRoulette community to jump on this and
create the Challenge for Matthew’s home province of Ontario, Canada.
Thanks, Binnette!

<blockquote>
<p>Since you are from Ottawa, I made a <a
href="https://twitter.com/hashtag/maproulette">#maproulette</a>
challenge for the whole Ontario. So you have 12k tasks to solve 😇<a
href="https://t.co/MoYkb6V0gX">https://t.co/MoYkb6V0gX</a> <a
href="https://t.co/XH25CxbGlF">pic.twitter.com/XH25CxbGlF</a></p>
<p>— Binnette (@BinnetteBin) <a
href="https://twitter.com/BinnetteBin/status/1334249950159450117">December
2, 2020</a></p>
</blockquote>

These tasks should be fairly easy to solve, especially with the great
instructions that go along with the Challenge. Can we fix all of them
before the end of the year? Let’s get started!
