# Trust & Safety Taskforce Meeting - 2026-08-19

## Attendees

Please specify your name or pseudonym, affiliation if any, and pronouns, as this will help us take accurate meeting notes.

(to be filled out during the meeting, also indicate if scribing)

- Emelia Smith (lead)
- Roel Roscam Abbing (@rscmbbng / @rra@post.lurk.org, he/him)
- a <trwnh.com> (they/them) (scribing)
- Julian Fietkau (@julian@fietkau.social, he/him)
- echo (Mastodon)
- Cassidy James (@cassidy@blaede.family, he/him)

## Administrivia:

1. IP Protection Note Reminder:
   - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
   - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Scribe volunteer(s)? If we can't find a scribe, I'll need to record the meeting and use AI/ML to prepare the meeting notes, or the meeting cannot proceed.

## Agenda:

1. Introductions, if necessary
2. Recap & Next Steps
3. Taskforce Leads: https://github.com/swicg/activitypub-trust-and-safety/issues/135
4. 12 Month Plan: https://github.com/swicg/activitypub-trust-and-safety/discussions/144 - https://github.com/swicg/activitypub-trust-and-safety/discussions/152

We support contributions to the Agenda, please comment if there is something that we need to address during the meeting.

You can find information on how to join the meeting in the [SWICG calendar](https://www.w3.org/events/meetings/29a5bd4f-bb6e-4830-bbf7-7ba290e89afa/)

## Introductions

Roel: I have been to 1 meeting before but all the way at the beginning. Recently finished doctoral dissertation looking at fediverse as a case study with a focus on content moderation and T&S, want to follow up on research by contributing to this community. co-admin of a small mastodon instance, active in ecosystem since 2018

echo: work for mastodon, formerly tumblr, content moderation tooling, representing mastodon in this TF

a: involved in social web things as power user for decade+

Julian Fietkau: Representing TIB Hannover, working on a project on decentralized research data management (feel free to ping me for details). New to the CG and the task force. Have done hobbyist ActivityPub development previously. Did some prior writing on interaction controls, to be discussed today.

Cassidy: I'm cassidy@blaede.family, work on roost.tools, recent attendance at fedicon, we build open source safety tooling

## Recap and Next Steps

### Resources on T&S

- [Trust & Safety Curriculum — Trust & Safety Professional Association](https://www.tspa.org/curriculum/ts-curriculum/)
- [Trust & Safety Library — Trust & Safety Professional Association](https://www.tspa.org/explore/trust-safety-library/)
- [The Trust & Safety Teaching Consortium | Teaching Trust and Safety](https://trust-safety-teaching-consortium.github.io/TeachingTrustSafety/)
- Crash course on T&S presentation: [ROOST FediCon 2026 • Coop](https://docs.google.com/presentation/d/1RU8U5bgTcOL_ZYHkKijoIcmkTyvR9KbAEXCIO1mHV8k/edit?slide=id.g3862a745a8f_1_22#slide=id.g3862a745a8f_1_22)
- Report on Fossy/Fedicon: [T&S Across the Fediverse: ROOST at FOSSY 2026](https://roost.tools/blog/trust-safety-across-the-fediverse-roost-fossy-fedicon-2026/)

### Currently in progress

draft of content labeling, draft of as:sensitive processing model

active grant to finish up current milestone of work. [milestone includes work items](https://github.com/swicg/activitypub-trust-and-safety/issues?q=is%3Aissue%20state%3Aopen%20milestone%3A%22Iteration%201%3A%20January%202026%20to%20December%202026%22)

addressing for moderation is in progress as well, hopefully can be finished soon, short timeframe here requires volunteers

a: the moderation addressing seems to be drifting to consensus of having moderators directly connected to actors instead of content, and no indirection via a host or service actor? please see the issue https://github.com/swicg/activitypub-trust-and-safety/issues/24 and review / leave feedback there

### Search for new TF lead

Emelia will be stepping down as TF lead and is searching for a new lead to organize meetings and keep the TF running administratively. expects to be winding down over the next few months.

Responsibilities include:

- Leading & planning meetings, & ensuring they are scheduled correctly
- Facilitating work, finding people to work on work items
- Working with grant funders to help fund the work the taskforce does.
- Publication of meeting minutes in a timely fashion
- Reviewing PRs to ensure that published output aligns with the agreed upon direction in discussions
- Attending Social Web CG meetings to report out about the task forces work

emelia: currently milestones are year-based and can be aligned with calendar year or grant year. workstreams have items to be handled within the milestones ideally, this provides us a way to show grant funders what we have delivered.

emelia: we need a new TF lead or the TF cannot continue.

emelia: I have been able to negotiate a grant for the next 12 months of the taskforces work, which we will discuss in a moment: https://github.com/swicg/activitypub-trust-and-safety/discussions/144

emelia: The amount of funding available does not replace normal income, but should be treated as supplemental. We need to look over what exists currently in github issues and decide which of them become work items on the grant. as well as items that people want to be done in the future.

## Votes on work items

- Interaction Controls, Replies, and Quote Posts:
  - Discussion: https://github.com/swicg/activitypub-trust-and-safety/discussions/152

  PROPOSED: We should produce a specification-track document for interaction controls

  +1's: Cassidy, Echo, Emelia, Roel, Julian
  +0's: a (the exact framing imo depends on what counts as an "interaction" vs just a "link", and in which contexts)

  Champion: Julian (a is willing to help write bits of it)

- Best practices for ActivityPub Implementors

  PROPOSED: Proactive "Best Practices" recommendations for AP implementors, including gotchas with untrusted remote data:
  - [#29: Proactive "Best Practices" recommendations for AP implementors](https://github.com/swicg/activitypub-trust-and-safety/issues/29)
  - [#36: Recommendation around handling objects that are created/published/updated with dates far from the current date](https://github.com/swicg/activitypub-trust-and-safety/issues/36)
  - [#33: Document Proactive vs Reactive Moderation](https://github.com/swicg/activitypub-trust-and-safety/issues/33)
  - [#68: Note: Open Registration Considerations](https://github.com/swicg/activitypub-trust-and-safety/issues/68)
  - [#67: Recommendations for Federation Management](https://github.com/swicg/activitypub-trust-and-safety/issues/67)

  +1's: a, echo, Roel, Cassidy, Julian, Emelia

  Champions: a, Roel

- Moderation Actions:
  - [#95: ActivityPub property to indicate an Actor is currently suspended / banned](https://github.com/swicg/activitypub-trust-and-safety/issues/95)
  - [#64: Ability for moderators to hide content without actually deleting it](https://github.com/swicg/activitypub-trust-and-safety/issues/64)

  PROPOSED: Moderation Actions (suspensions, temporarily hiding content under moderation)

  +1's: Cassidy, Julian, a, echo, Roel, Emelia

  Champion: a

- Round two of Improvements to Moderation Activities & UX of moderation
  - [#14: Formally define the Flag activity for sending reports](https://github.com/swicg/activitypub-trust-and-safety/issues/14)
    - [#8: Idea: stable, opaque identifiers for originator of Flag activities](https://github.com/swicg/activitypub-trust-and-safety/issues/8)
    - [#3: Improve Flag activities to differentiate the object being reported vs the evidence for that report](https://github.com/swicg/activitypub-trust-and-safety/issues/3)
    - [#2: Improve Flag activities to include the categorisation of the report](https://github.com/swicg/activitypub-trust-and-safety/issues/2)
  - [#23: Define/document how blocking works in S2S](https://github.com/swicg/activitypub-trust-and-safety/issues/23)
  - [#71: IR Section 4: Reporting UX for the reporting user](https://github.com/swicg/activitypub-trust-and-safety/issues/71)
  - [#69: IR Section 4: General Report Management](https://github.com/swicg/activitypub-trust-and-safety/issues/69)

  +1: Cassidy, Julian, a, Roel, Emelia

- Automated filtering / anti-spam explainer
  - Current text on anti-spam measures, needs expanding: https://swicg.github.io/activitypub-trust-and-safety/#anti-spam
  - [#28: Idea: Automated filtering](https://github.com/swicg/activitypub-trust-and-safety/issues/28)

  -1: Emelia, Roel, Cassidy
  -0: a, Julian

## Action Item:

- [ ] Emelia to convert [#152: Should we produce a specification-track document for interaction controls?](https://github.com/swicg/activitypub-trust-and-safety/discussions/152) into an issue & workstream
- [ ] Emelia to write Memorandum of Understanding for the above approved work streams / work items
