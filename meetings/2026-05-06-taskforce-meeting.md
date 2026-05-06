# 2026-05-06: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith
- Imani (Mastodon)
- Echo (Mastodon)

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
  - Emelia has followed up with Ben on this issue via DM

## Minutes

In this meeting we decided to focus on #24, #84, and briefly #122. Other items that had been requested on the agenda were skipped due to only the Mastodon team being in attendance.

### Taskforce status & co-lead search

- Emelia opened with a reminder that the taskforce is still seeking another co-lead following Darius stepping back to chair the Social Web WG. Emelia's availability is constrained by chronic illness and client work, so a second co-lead is needed for continuity.
- Echo noted that with Mastodon now a W3C member, there is interest from Mastodon in being more present at these meetings.
- Action: Emelia to open a GitHub issue advertising the co-lead search so it can be linked outside the mailing list.

### External: ActivityPub-E2EE & reporting messages

- Emelia gave a brief status update on the E2EE taskforce's requests to the T&S taskforce. Two issues were raised by the E2EE group:
    - **Blocking & receiving messages from blocked people**: Emelia responded that if the channel is genuinely end-to-end encrypted, then the server would not know about whether or not someone in a chat is blocked.
    - **Reporting messages to moderators**: There is no benefit to "end-to-end encryption" between a user and their server when the server decrypts the report. In order to use E2EE, the reports would have to be encrypted between the reporting user and the individual public keys of moderators of the receiving server, and even then the report will usually end up in clear text at some point in the moderation lifecycle.
- This work is not currently on the T&S taskforce's agenda but may be added later if that taskforce requests it. 
- Echo asked that if it does come up, it be added to the agenda in advance so they can prepare. (It will definitely be, and Emelia will try to get agenda's put together in advance).

### #24 — Addressing for moderation activities / discovery of an actor's moderators

- Background: Mastodon currently sends `Flag` activities to the inbox of the actor being flagged, which is incorrect. The taskforce needs a way to discover the moderator(s) for a given actor and to verify that relationship.
- Emelia's proposal: a `moderatedBy` property on the actor document, pointing at a moderation actor (likely a Group actor, possibly multi-typed). The link should be verifiable so that arbitrary actors cannot claim to be moderated by an actor's inbox that isn't actually responsible for them.
- **Verification approach discussed**: a signature over the combination of the moderation actor ID and the moderated actor ID, signed with the moderation actor's private key. Signing both IDs together prevents copying the assertion from one actor document to another, signature allows quickly checking.
- Why not an unordered collection on the moderation actor listing the actors it moderates? Emelia: discoverability is an abuse vector — you don't want to give a bad actor a one-shot way to enumerate every actor a moderator covers (e.g., for DDoS-by-report).
- Echo questioned whether the cryptographic signature is necessary, given that the receiving moderator inbox is the source of truth and can `Reject` a `Flag` if the relationship no longer holds. Emelia agreed this is workable; the signature is mainly a semantic shortcut to avoid unnecessary HTTP round trips and `Reject` activities. Trade-off acknowledged: cryptography adds friction for new implementers. (I'd probably just be a HMAC sha256, and we'd specify that)
- **`Reject` for stale relationships**: if a moderator is no longer responsible for a given actor, the moderator inbox returns a `Reject` of the `Flag`, ideally signaling that the relationship has ended. This case is expected to be rare given the current shape of the Fediverse (most actors are moderated by their hosting server). One edge case noted is outsourced moderation arrangements that end — those would produce stale `moderatedBy` data until the source server updates its actor documents.
- **Discovery of an instance's moderation actor**: NodeInfo's metadata field could be used to advertise the moderation group actor for a server. This was considered viable if needed, though not mandatory for this feature.
- **Why this matters beyond `Flag` routing**: a moderation actor unlocks federated moderator-to-moderator notes allowing moderators to communicate with each other. Also potentially useful for Groups and E2EE taskforce's moderation routing.
- a's existing direction on this issue (more general service-record / linked-data approach) was noted; Emelia prefers a narrower, moderation-specific solution rather than solving the abstract problem.

**Outcome**: Echo to take this back to the Mastodon team to gauge bandwidth for contributing or reviewing an FEP. Emelia's current shape of the proposal: a `moderatedBy` property containing the moderation actor ID and (optionally) a signature; if the relationship is invalid or absent, `Flag`s continue to fall through to the actor's inbox as today.

### #84 — Content Labels FEP

- Emelia walked through the in-progress FEP draft.
- **Framing**: the FEP will explicitly explain why the taskforce is not specifying a content-warnings property. Adding a content-warnings property would require two properties (one to signal "I understand content warnings" and one for the warning itself) to be migration-safe, and the existing convention of `summary` + `as:sensitive` already serves that purpose. A separate explainer on this decision is being authored by a as a separate PR.
- **Structure**: a content label is included in the `tag` array of an Object, alongside hashtags. The type would be `ContentLabel` (or possibly just `Label` — TBD). The `id` references the canonical label definition. (See AppliedLabel discussion below)
- **Label collections and context**: each `Label` has a `context` property pointing back to the collection of labels it belongs to. This allows software to discover the full set of labels in a given vocabulary, and allows different vocabularies (Mastodon-defined, DTSP, server-specific, etc.) to coexist. Receivers encountering an unknown label can resolve it, fetch its metadata, and surface the label's source to the user.
- **Label metadata**: localizable `summary` and `content`, plus optionally a `url` pointing to a human-readable description.
  - `url` should probably be mandatory, or at least strongly recommended in the FEP version.
- **Taxonomy vs. flat structure**: the FIRES reference implementation is flat. Some taskforce members have argued for broader/narrower hierarchical labels, with some precedent in JSON-LD for the broader/narrower terminology.
  - Imani raised the case where a label (e.g., nudity in reproductive-health context) doesn't sit cleanly under a single parent
  — Emelia noted this is precisely the tension. 
  - Echo indicated Mastodon would likely keep it flat in their initial implementation. 
  - Final approach TBD; the FEP will likely allow but not require taxonomical structure.
- **Distinction from hashtags/topics**: Echo and Imani noted, in part referencing Renaud's earlier comments about topics, that content labels are explicitly a separate system from hashtags or other taxonomical systems. Hashtags are documented elsewhere; this FEP is not attempting to merge or unify those.
- **Self-labels vs. third-party labels**: we can borrow from Bluesky here, the FEP should distinguish labels that an actor can apply to their own content/account versus those that can only be applied by a moderation service. This FEP only addresses first-party (self) labeling. Third-party / server-applied labels are deferred to a follow-up FEP, likely via Web Annotations (existing issue noted).
- **Imani's questions**:
    - *Moderator-only labels (e.g. CSAM categories that should never appear in a composer)*: yes, in principle possible — UI surfacing is an application concern, not a protocol one. The protocol shouldn't dictate which labels Mastodon shows in its composer.
       - Specifically labels here are about public disclosure, not moderation workflows/queues or reporting categories. There's a separate issue for federating server rules (which will likely go through the moderation actor)
    - *Labels on actors, not just content*: yes, since labels go in the `tag` array and actors support `tag`. Some discussion about whether label vocabularies should declare which types they apply to — Emelia leaned against this, since "content" vs. "actor" isn't cleanly separable (Mastodon treats articles, videos, notes uniformly).
    - *Linking moderation decisions to labels (e.g. "this follow request is blocked because this user was flagged for hate speech")*: this is an application/UI concern — Mastodon can implement this however it likes on top of the labels primitive, but it's not strictly part of the FEP.
- **Federation visibility**: Echo noted that given the openness of the Fediverse, raw label data will be public. UI exposure is a separate concern from federation-level visibility.
- **References**: Bluesky's label definitions document (with top-level `label_values` and per-label display metadata) was cited as a useful source to borrow from, alongside FIRES and DTSP:
  - https://lexicon.garden/lexicon/did:plc:4v4y5r3lwsbtmsxhile2ljac/app.bsky.labeler.service/docs
  - Essentially it has properties for selfLabel, defaultSetting, severity, adultOnly, and blurs on a label. These could be useful properties in the Labels FEP, though TBD what that would look like.

**Outcome**: Echo to take the labels proposal back to Mastodon for input on bandwidth and the moderator-applied-labels question. Emelia continuing to draft the FEP.

### `as:sensitive` and application to Actors

- We did discuss `as:sensitive` and whether it can be applied to actors, the answer is yes, as all actor types extend Object. Also noted was that `as:sensitive`'s domain was recently increased to support applying `as:sensitive` to Link types as well, which has updated the CR there: https://swicg.github.io/miscellany/#sensitive
    - The use-case for this is to be able to provide people a warning modal before continuing to view a link that has been determined to be sensitive.
    - Supporting the `tag` property on Links could also be useful for applying Labels to Links themselves, not to the post that contains the link, however, `Link` does not currently support this property.

### `AppliedLabel` discussion
- Echo asked about labels and how a server would apply them.
- Emelia: The current thinking was that labels that appear in the `tag` array on an Object would be first-party (i.e., the actor themselves has applied that label), and that moderation-actor-applied or third-party would be through the follow-up FEP for that, which probably uses web annotations.
- Echo asked why can't we just add `attributedTo` on a label within the `tag` array.
- Emelia: The reason for this is because of JSON-LD and object identity, you'd effectively end up with `attributedTo` being a property of the Label, when it's not. It's a property of the application of that Label.
- Echo & Emelia discussed some trade-offs, essentially concerns about another instance not knowing that the moderation actor is publishing Annotations on Objects to Label them, and that could create safety concerns, so for labels applied by the `moderatedBy` actor should actually exist within the `tag` array. This led to discussion about an `AppliedLabel` type (transient, `attributedTo` optional, label (id or minimal embedded)), versus the `Label` object itself.


## Action Items

- [ ] Emelia: open a GitHub issue advertising the co-lead search (linkable outside the mailing list).
- [ ] Echo: take #24 (`moderatedBy` / discovery of moderators) back to Mastodon to gauge bandwidth for contributing or reviewing an FEP.
- [ ] Echo: discuss with Mastodon the various options for Labels and Moderated By (including the `AppliedLabel` shape).
- [ ] Emelia: try to finish at least some draft text for the labels FEP, otherwise open it up to others to author (review and merge an existing PR, or open PRs against the existing PR).
