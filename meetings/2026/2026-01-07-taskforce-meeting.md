# 2026-01-07: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith <@thisismissem@hachyderm.io>
- Juliet Shen <@julietshen.mstdn.social> / <juliet@roost.tools>
- a <trwnh.com>
- Denny <denny@tattle.co.in>
- JustATrashPanda <@trashpanda@m.alittlenook.net>
- GANitak <@GANitak@hachyderm.io>

## Agenda

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Funding update
5. Update on Labels FEP
6. Other items

Original agenda: https://github.com/swicg/activitypub-trust-and-safety/issues/111

## Minutes

1. Funding Update: https://github.com/swicg/activitypub-trust-and-safety/blob/main/meetings/2024-11-12-taskforce-meeting.md
    - No updates, waiting to hear from NLNet.
2. Labels FEP: https://github.com/swicg/activitypub-trust-and-safety/pull/116
    - Work in progress, Emelia had to focus on client work so hasn't made too much progress yet.
    - No content warnings FEP, see: https://github.com/swicg/activitypub-trust-and-safety/issues/1#issuecomment-3607876566
3. Juliet: Roost.tools has two open-source tools for trust & safety, Osprey and Coop, Coop is a moderation & report management tool. If you're interested in it, reach out to Juliet: juliet@roost.tools
    - https://github.com/roostorg/osprey is already open sourced
    - Coop will be released in February and is a flexible review tool
4. Question: What's a FASP from Juliet
    - https://github.com/mastodon/fediverse_auxiliary_service_provider_specifications/
    - Essentialy an additional protocol outside of ActivityPub that allows two services to share and interact on data. Currently no trust & safety aspects have been defined for it.
5. Question: Controlling what as:sensitive applies to
    - a: Can we control what properties as:sensitive applies to? as:summary might itself be sensitive or just the as:content or any/all as:attachment
    - Emelia: no, it applies to the entire parent object. If for instance, you mark a Note as as:sensitive, then the entire note is considered to contain sensitive content.
    - Emelia: We have had as:sensitive's domain expanded to cover Link, so we can have a `as:sensitive` on a `Link` object as an `attachment` on the note, see: https://fediverse.codeberg.page/fep/fep/8967/
        - a: canonically that's https://w3id.org/fep/8967
    - Someone could write up an explainer document on "Handling  sensitive content in ActivityPub"
6. Question: Content Warnings from a
    - a: we can probably still look at extending content warnings later but right now i agree that the focus should be on content labels. however, we can still explore the processing expectations for as:sensitive in the initial report (https://github.com/swicg/activitypub-trust-and-safety/issues/32) -- for example, look at what current consumers do, and what could be done + future directions
    - Emelia: I don't think there's ever a chance we could add an additional property for content warnings without adding confusion to consuming software between `summary` and a theoretical `content_warning` property. Relying on `summary` + `as:sensitive` to render the summary as a "content warning" is probably the way to continue. Perhaps an explainer document (needs author)
    - a: i'm less pessimistic but i think that this needs to be handled carefully yeah. willing to write about it in initial report (or a separate explainer that can be linked from the initial report)

7. Issue 96: Creative Commons Signals
    - https://github.com/swicg/activitypub-trust-and-safety/issues/96
    - Feedback from the community at large was negative on the CC Signals approach, because it assumed consent (opt-out) instead of opt-in.
    - Emelia: Not sure there is anything for the taskforce to do specifically, recommends closing as won't fix.
    - a: +1
8. Issue 95: Actor property indicating suspension
    - Needs work from someone to write a FEP for this
    - Can't reuse Mastodon's property as that's `toot:suspended` and not a generic namespace, however, would recommend being compatible and documenting processing for it.
    - Just send a pull request to https://github.com/swicg/activitypub-trust-and-safety/pulls
    - a: we can absolutely reuse `http://joinmastodon.org/ns#suspended` but we should probably loop mastodon in on this. i'll reach out to them and see if they want to move forward with a FEP (which i can write)

9. Issue 97: Allow users to mark links as being sensitive content and/or remove their previews
    - https://github.com/swicg/activitypub-trust-and-safety/issues/97
    - Resolved by [FEP-8967](https://w3id.org/fep/8967) and expanded domain on as:sensitive to allow it on as:Link
    - We could write a Explainer document as mentioned above.

9. Issue 57: Encourage flexible policies rather than binary actions
    - https://github.com/swicg/activitypub-trust-and-safety/issues/57
    - Open to a PR, but the initial report isn't intended to explain all possible safety mechanisms, just the core ones you should probably have at various points in a project's lifecycle. We've seen too many new projects federate with the entire internet openly, without realising that there's a tonne of bad stuff on the internet which could get them in trouble. So the report could have language like "Here's some basic concepts you should implement in fediverse software prior to launch" and one of those would be "A mechanism for managing who you federate with"
    - a: this is fine, i think the intent of the issue is to say something like "in the AS2 vocab we have Ignore and Block, but you should go beyond that ideally"

## Action Items

- Explainer on as:sensitive processing model - "Handling  sensitive content in ActivityPub"
- Explainer on Content Warnings as they currently exist (summary + as:sensitive = content warning)
- Initial Report: Ignore and Block in the vocab but do better ideally
- a: reach out to mastodon if they want to move forward on toot:suspended
