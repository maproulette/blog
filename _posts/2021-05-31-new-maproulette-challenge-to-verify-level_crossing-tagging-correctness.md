---
title: New MapRoulette Challenge to verify level_crossing tagging correctness
date: 2021-05-31T11:14:50-07:00
updated: 2021-05-31T11:15:04-07:00
author: Martijn
category: Challenge
---

*This is a guest post by Alex Iannicelli and Yunzhi Li from Facebook.*

Throughout the United States there are many places where railways
intersect with highways to create “[Level
Crossings](https://wiki.openstreetmap.org/wiki/Tag:railway%3Dlevel_crossing)”.
Representing these intersections in OSM correctly can improve renderings
and routing algorithms. To help improve these intersections we recently
created a MapRoulette challenge to
verify <a href="https://maproulette.org/browse/challenges/17664"
target="_blank" rel="noreferrer noopener">level_crossing tagging
correctness on railways</a> in the US. If you are interested in helping
to improve level crossings in the US, you can find this challenge
here: <https://maproulette.org/browse/challenges/17664>. We’ve included
detailed instructions in the challenge and most issues should be
straightforward to address.

<figure>
{% picture images/level_crossing_in_brisbane.jpg %}
<figcaption>A level crossing in Brisbane, Australia. Source: Ash Kyd on
<a href="https://flic.kr/p/7x3Hgy">Flickr</a></figcaption>
</figure>

The challenge was generated using [Atlas
Checks](https://github.com/osmlab/atlas-checks/blob/dev/docs/checks/levelCrossingOnRailwayCheck.md),
which is a quality assurance tool for map features. You can learn more
about it here: <https://github.com/osmlab/atlas-checks>. The level
crossing atlas check looks for nine different issues that we see
regularly having to do with these level crossings. The following is a
brief description of the issues that are flagged by this check:

1.  When an area or way contain `railway=level_crossing` tag.
2.  When a car navigable highway crosses a railway on the same layer and
    the intersection node contains `railway=crossing` Instead of
    `railway=level_crossing`.
3.  When a car navigable highway crosses a railway on the same layer and
    the intersection node does not contain railway tag.
4.  When a node contains `railway=level_crossing` but there are no car
    navigable highways that contain this node.
5.  When a node contains `railway=level_crossing` but there are no
    railways that contain this node.
6.  When a node contains `railway=level_crossing` but there are no
    railway and car navigable ways on the same layer.
7.  When a car navigable highway crosses a railway on the same layer and
    an intersection node is missing.
8.  When a node contains `railway=level_crossing` but there are only
    pedestrian highways at this intersection.
9.  When a node contains `railway=level_crossing` but there are only
    bicycle ways at this intersection.

If you’d like to learn more about the Atlas Check that was used to
create the challenge we invite you to read about it
here: <https://github.com/osmlab/atlas-checks/blob/dev/docs/checks/levelCrossingOnRailwayCheck.md>

We look forward to any feedback!

Please let us know if there are any questions or suggestions about the
challenge or If you have feedback about Atlas Checks or ideas for new
validations that you’d like to see added to Atlas Checks by getting in
touch with us on slack or through OSM.

*Would you like to promote your Challenge on the MapRoulette blog? Send us an email!*
