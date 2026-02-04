# 2026-02-04: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith <@thisismissem@hachyderm.io>
- a <trwnh.com>
- [Ted Thibodeau Jr](https://www.linkedin.com/in/macted/) (he/him) (OpenLinkSw.com) // GitHub:[@TallTed](https://github.com/TallTed) // Mastodon:[@TallTed](https://mastodon.social/@TallTed)
- Julian Lam


## Agenda

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Darius is now Working Group chair, so we may need another chair to come onboard to help.
5. Agenda
  - 1 issue [pending closure](https://github.com/swicg/activitypub-trust-and-safety/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22Pending%20Closure%22)
  - 1 other issue [waiting for commenter](https://github.com/swicg/activitypub-trust-and-safety/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22Waiting%20For%20Comment%22) (action would be to mark as pending closure)
  - 1 issue for [taskforce admin](https://github.com/swicg/activitypub-trust-and-safety/issues?q=is%3Aissue%20state%3Aopen%20label%3A%22Taskforce%20Admin%22) (I don't think we can move forwards on it)
  - otherwise an open agenda
6. Conclusions / Action items

Original agenda: https://github.com/swicg/activitypub-trust-and-safety/issues/120

## Past Action Items

- Explainer on as:sensitive processing model — "Handling  sensitive content in ActivityPub"
- Explainer on Content Warnings as they currently exist (summary + `as:sensitive` = content warning)
- Initial Report: `Ignore` and `Block` in the vocab but do better ideally
- a: reach out to Mastodon to see if they want to move forward on `toot:suspended`

## Minutes

- Emelia opened the meeting with the taskforce status, funding and Darius's co-lead status:
    - At present the taskforce has a severe lack of contributors, and we're struggling to get people engaged and interested.
    - Emelia often needs to focus on paid work, and there is no update from NLNet regarding our grant application.
    - Darius is now the Chair of the Social Web WG, so won't be able to actively participate. We may be open to a new co-lead for the taskforce.

- a: Nothing concrete, two parts: implementers and participants. Outreach is reaching the right people in the first place. What is our total pool of potential participants? Are there people we aren't reaching that we should be? For implementers, I don't know how much they necessarily care, but they don't necessarily see the urgency of the action items here. Situation might change when we publish something, getting them involved would be nice.
- Julian mentioned GtS in the chat
- Julian: From my point of view, there are implementers interested in trust & safety but not the nitty-gritty of implementing it. So for instance, GtS has interaction controls for content in their software. As a third-party, I'm not sure what is the next thing to work on for my software. A primer might help.
- Emelia: We decided early on that we weren't going to write a interactions control FEP, since it sounded like others were going to write it maybe. This hasn't materialized though.
- Emelia: [The initial report](https://swicg.github.io/activitypub-trust-and-safety/initial-report/) is meant to be the document that says "this is where we are, and what we need" as to get people thinking about trust & safety — https://swicg.github.io/activitypub-trust-and-safety/initial-report/
- a: Report back on Mastodon's `suspended` property — Mastodon is not interested in doing much else with the property, and disinterested in adding things like datetimes or reasons. they might end up doing a way to signal that an account is silenced?
- Emelia: I think there is some value in having a properly defined "suspend" that communicates more than just a boolean yes/no, e.g., when were they suspended and how long are they suspended? The latter could allow servers to purge content pre-emptively from their cache if they know the suspension isn't reversible.
- Julian is potentially interested in this for NodeBB.
- We moved on to the other agenda items:
- Emelia: on Peer Moderation: I don't think there's anything actionable here, because we don't see this type of functionality in any existing software: no demand = no action.
- We mentioned how this can't really work in the context of ActivityPub, because we don't currently have moderation actors or the ability to address things to moderators. https://github.com/swicg/activitypub-trust-and-safety/issues/24
- a volunteered to take a look at this issue.
- Closure for peer moderation approved.
- Emelia: on SWICG Calendar: There is similarly nothing we can do right now, so we will close the issue, but we will untag it as "editorial" and "skip digest" so that it will appear on the mailing list.
- Closure approved
- Emelia: on flexible policies: a PR has been filed, so we are untagging it as "waiting for comment" and tagging it as "needs review"
- Action Item: Pull request needs review.

## Action Items

- [ ] a: assigned to moderation activities (exploration of the issue of the "service" relation between a user and a service for the purpose of moderation) https://github.com/swicg/activitypub-trust-and-safety/issues/24
- [ ] everyone: review PR https://github.com/swicg/activitypub-trust-and-safety/pull/121 for flexible policies language in initial report
- [ ] everyone: review PR https://github.com/swicg/activitypub-trust-and-safety/pull/122 for as:sensitive and content warning first draft
- [ ] marked https://github.com/swicg/activitypub-trust-and-safety/issues/95 as needs FEP/Proposal, a may work on that.
