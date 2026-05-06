# 2026-05-06: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith
- Imani (mastodon)
- Echo (mastodon)

## Agenda:

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Topics
    - [Addressing for moderation activities / Discovery of an Actor's moderators #24](https://github.com/swicg/activitypub-trust-and-safety/issues/24)
    - PR: [Add recommendation for granular policies to initial report #121](https://github.com/swicg/activitypub-trust-and-safety/pull/121)
    - PR: [Add first draft of as:sensitive and content warning processing model #122](https://github.com/swicg/activitypub-trust-and-safety/pull/121)
    - External: [ActivityPub-E2EE & Reporting messages](https://github.com/swicg/activitypub-e2ee/issues/77#issuecomment-4382341437)
    - [Content Labels FEP](https://github.com/swicg/activitypub-trust-and-safety/issues/84)


## Past Action Items

The following were past action items, but we opted to not discuss due to time constraints & the specific people involved not being present on the call.

- [ ] a: to write a comment on #24 on approaches to moderation actor relationships
- [ ] Darius: review #121 and #122
- [ ] Ben Pate: to tentatively write a FEP for #95 - https://github.com/swicg/activitypub-trust-and-safety/issues/95

## Minutes

In this meeting we decided to focus on #24, #84, and briefly #122, other items that had been requested on the agenda were skipped due to only the Mastodon team being in attendance.

- TODO: Minutes from the recording, the first hour of the meeting was recorded and I'll add the transcribed conversation here.

- We did discuss `as:sensitive` and whether it can be applied to actors, the answer is yes, as all actor types extend Object. Also noted was that `as:sensitive`'s domain was recently increased to support applying `as:sensitive` to Link types as well, which has updated the CR there: https://swicg.github.io/miscellany/#sensitive
    - The use-case for this is to be able to provide people a warning modal before continuing to view a link that has been determined to be sensitive.
    - Supporting the `tag` property Links could also be useful for applying Labels to Links themselves, not to the post that contains the link, however, `Link` does not currently support this property.

- Echo asked about labels and how a server would apply them
- Emelia: The current thinking was that labels that appear in the `tag` array on an Object would be first-party (i.e., the actor themselves has applied that label), and that moderation-actor-applied or third-party would be through the follow-up FEP for that, which probably uses web annotations.
- Echo asked why can't we just add `attributedTo` on a label within the `tag` array
- Emelia: The reason for this is because of JSON-LD and object identity, you'd effectively end up with `attributedTo` being a property of the Label, when it's not. It's a property of the application of that Label.
- Echo & Emelia discussed some trade-offs, essentially concerns about another instance not knowing that the moderation actor is publishing Annotations on Objects to Label them, and that could create safety concerns, so for labels applied by the moderatedBy actor should actually exist within the `tag` array. This led to discussion about an `AppliedLabel` type (transient, attributedTo optional, label (id or minimal embedded)), versus the `Label` object itself.


## Action Items
- [ ] Echo to discuss with Mastodon the various options for Labels and Moderated By
- [ ] Emelia to try to finish at least some draft text for labels FEP, otherwise she'll open it up to others to author (so we'd review and merge the exist PR or open PRs against it).
