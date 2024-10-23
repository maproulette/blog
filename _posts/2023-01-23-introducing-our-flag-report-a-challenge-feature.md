---
title: Introducing our Flag/Report a Challenge Feature
date: 2023-01-23T15:05:19-08:00
updated: 2023-01-23T15:06:02-08:00
author: Jackson Tran & Yan Sun
category: Feature
---

*This post was written by MapRoulette contributors [Jackson
Tran](https://www.openstreetmap.org/user/javtran) and
[Yan Sun](https://www.openstreetmap.org/user/tsun812).*

MapRoulette is a platform that was designed for user tasks as means to
make changes in OSM. Because of its self-governing nature, some tasks on
MapRoulette aren’t articulated clearly to MapRoulette users. In version
3.11.6, we would like to introduce a flag/report feature. The flag
feature allows mappers to report any questionable encounters within a
challenge that did not meet quality standards.

Please feel free to
visit <https://github.com/maproulette/maproulette3/issues/1868>, if
you’d like to know more about the ideas behind this feature.

## Walkthrough of the flag feature

Upon coming across something we want to flag in a challenge, go to the
challenge details page that belongs to the challenge, there you will be
able to see a flag icon next to the challenge name.

<figure>
{% picture images/flagging-challenge-details.png %}
</figure>

Simply click on the flag icon, an email modal will appear to flag this
challenge. Please include your email address, a flag description, and
make sure you check _I have attempted to contact the challenge creator_
before proceed. Click on the _Flag Challenge_ button to submit a
flag. This will open an issue in Maproulette’s [challenge-reports
repository](https://github.com/maproulette/challenge-reports/issues) on
GitHub and generate a message in the comment section of this challenge. 

<figure>
{% picture images/flagging-modal.jpg %}
</figure>

Once the challenge is being successfully flagged, the flag icon will be
filled red.

<figure>
{% picture images/flagging-challenge-flagged.jpg %}
</figure>

Clicking on the flag icon will redirect you to the issue’s page on
GitHub .

<figure>
{% picture images/flagging-github.jpg %}
</figure>

You could also view information related to this issue in the comment
section of this challenge( by clicking on Get In Touch).

<figure>
{% picture images/flagging-comment.jpg %}
</figure>

Please note that only logged in user is able to flag a challenge. And if
an issue has already been flagged by a user, we can only flag the same
challenge again once that issue has been resolved.

We hope flag feature will help maintain and improve the overall quality
of challenges on MapRoulette by passing our users abilities to regulate.
Please don’t hesitate to let us know what you think about this feature,
thanks for reading!
