# 2026-06-17: ActivityPub Trust & Safety Task Force Meeting

This meeting was a catch-up meeting for our normally scheduled meeting on 2026-06-03 which wasn't able to happen due to Emelia being out sick.

## Attending

- Emelia (taskforce lead)
- a
- Echo (Mastodon team)
- Anuj (observer)

## Administrivia

1. IP Protection Note Reminder:
   - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
   - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Scribe volunteer(s)? If we can't find a scribe, I'll need to record the meeting and use AI/ML to prepare the meeting notes, or the meeting cannot proceed.

## Agenda:

1. Introductions, if necessary
2. Pull Request [#122](https://github.com/swicg/activitypub-trust-and-safety/pull/122) - Content Warning Processing Model
3. Pull Request [#116](https://github.com/swicg/activitypub-trust-and-safety/pull/116) - Content Labelling (issue: [#84](https://github.com/swicg/activitypub-trust-and-safety/issue/84))
4. Issue [#24](https://github.com/swicg/activitypub-trust-and-safety/issue/24) - Addressing for Moderators (#132 was opened but we need to discuss)
5. Time permitting: PR [#121](https://github.com/swicg/activitypub-trust-and-safety/pull/121) & [#129](https://github.com/swicg/activitypub-trust-and-safety/pull/129) (these will probably be bumped to July's meeting)

## Past Action Items

_None carried over._

## Minutes

_Anuj attended as an observer to learn for another task force. These minutes were prepared from the meeting recording with AI assistance._

The meeting covered the content warning processing model (#122), content labeling (#116), and addressing for moderators (#24/#132) in depth, spending most of its time on the unresolved question of how to verify a `moderatedBy` relationship. PRs #121 and #129 were deferred to July as expected.

### #122 — Content warning processing model

- **Scope.** a drafted this as a CG report. Building on several earlier meetings spent exploring content warnings, the aim is to document how CWs work on the Fediverse _today_ via the combination of `as:sensitive` and `summary` — not to define a new content-warning property.
- **Why not a new property.** Defining a dedicated CW property reintroduces the migration problem the group hit previously: a receiver can't tell whether an author who omitted a CW simply doesn't understand the concept, so you'd need a second property signalling "I understand CWs and deliberately set none." Documenting existing behaviour is the agreed compromise.
- **Processing model.** `as:sensitive: true` with no `summary` → treat as sensitive content. `summary` present with `as:sensitive` not true → treat the `summary` as a summary only. `as:sensitive` equal to true with `summary` → treat `summary` as the content warning.
- **Attachment scope.** `as:sensitive` can apply at attachment scope (Mastodon does this). Emelia noted the group previously got the scope of `as:sensitive` expanded to also cover `Link` (since `Object` and `Link` are disjoint), via the SWICG [miscellany document](https://swicg.github.io/miscellany/#sensitive).
- **Prior art.** References Shel Raphen's [On Content Warnings](https://shelraphen.com/on-content-warnings/#mastodon-and-content-warnings), which also informed the content-labeling work (#116).
- **Open issues.** Some language is Mastodon-specific and should be generalised; examples may need reworking to read as normative rather than abstract; two embedded GitHub links may not belong; and whether the existing `as:sensitive` text is the right wording is a future discussion.
- **Preview tooling.** ReSpec/HTML PRs are hard to review and can't be previewed without paid hosting (GitHub Pages doesn't cover it); the current preview link doesn't execute the ReSpec JavaScript. Emelia took an action item to investigate PR previews (possibly a service like OnRender) and what funding is available.

**Outcome:** Push for an intent-to-merge on #122 and keep building on it afterwards; needs another review round, aiming to have it merged by next meeting.

### #116 — Content labeling

- **Concept.** Authored by Emelia in Markdown (issue #84). Content labels decouple labeling from authorship: a canonical _label definition_ can be applied by any third party, not only the author. This targets the self-censorship/shaming dynamic where authors are blamed for not adding a CW, when anyone could apply the label. Inspired by Bluesky's third-party labeling model.
- **Naming/model.** `LabelDefinition` (renamed from `Label`) is the canonical definition; `Label` now denotes the _application_ of a label and extends `Link`, with `href` carrying the IRI of the label definition.
- **`href` vs `id` debate.** a questioned using `href` rather than `id`, arguing it isn't really being used as a link but as a direct reference to the label definition, and floated a `Label`/`AppliedLabel` split. Emelia's rationale for `href`: the application is _not_ the definition, so `id` would wrongly imply they are the same object; `href` also mirrors how `Hashtag` works (type `Hashtag` with an `href`). a will leave extended comments in PR review.
- **Moderator-applied vs self labeling.** Labels need to distinguish first-party self-labeling from moderator-applied labeling via `attributedTo`. Where the server is also the actor's moderator (the common case), this collapses into `attributedTo` pointing at the moderation actor (the actor's `moderatedBy`), avoiding the need to subscribe to a separate moderation actor. a observed this closely resembles the annotation model without using it, and generalises to any case where a service publishes on a user's behalf and controls the canonical representation.
- **Upstream `Update` problem.** Server-to-server `Update` is a full replace, so the whole object must be re-sent (omitted fields are dropped); the C2S-partial vs S2S-full discrepancy is broken upstream and likely needs a Working Group fix. The report will have to work around it for now. a will propose in review that the label _application_ could itself be an `Activity` that flows through moderation actors/labelers.
- **Default vocabulary.** Echo relayed internal review (Claire, David: looks good) and raised the lack of a default label vocabulary — risking a dozen duplicate definitions, aliasing maintenance, and inconsistent moderator handling. Emelia deliberately avoided defining a vocabulary in the report (bikeshedding risk; no clear place to host it at CG/WG level, though w3id.org exists) and suggested implementers — possibly with European.social — define a common one collaboratively. Echo noted Imani has already drafted a list intended for Mastodon, but the team wants to avoid Mastodon's choices becoming a de facto standard. Emelia noted European.social may be defunct (funding); Echo will check, as they may want to partner.
- **Screenshots.** Emelia wants to replace the mastodon.social showcase screenshots with abstract mockups so the spec doesn't single out Mastodon, and asked for mockup-tooling suggestions.

**Outcome:** Needs more review. Aliasing and recommended-actions are already in; a default vocabulary is left to implementers rather than the report.

### #24 / #132 — Addressing for moderators

- **Context.** Issue #24 covers addressing for moderators. a opened PR #132, but it introduces a "host" concept (who hosts an actor/object, separate from who moderates it) that is broader than the Task Force needs. The TF is scoped more narrowly toward improving moderation activities and addressing, not defining new structural concepts.
- **Emelia's pushback.** Introducing "host" is out of scope: it drags in ActivityPub's broken same-origin assumption and invites bikeshedding over what "host"/"server" means. ActivityPub has no real concept of a server. Better to lift that vocabulary into ActivityPub itself and keep the TF focused on a `moderationActor` and a `moderatedBy` property — which is more likely to be adopted by implementations and to bubble up to the Working Group.
- **a's argument.** The application actor is not necessarily the administrator (e.g. mastodon.social's admin is a designated _account_, not the application actor). a reworked the PR to borrow XMPP's "contact addresses" concept (explicit abuse/support contacts). The obstacle: XMPP has an explicit notion of the service; ActivityPub doesn't, so the concept exists in the Fediverse but can't be reasoned about because the vocabulary is missing. There is a FEP on identifying the application actor exposed via the NodeInfo link ([FEP-2677](https://fediverse.codeberg.page/fep/fep/2677/)), plus a related FEP Emelia couldn't name on the call — [FEP-f1d5](https://fediverse.codeberg.page/fep/fep/f1d5/), which formalises ActivityPub + NodeInfo.
- **Hats.** Wearing his WG hat, a agreed this will likely land in ActivityPub eventually; wearing his CG/TF hat, he asked how useful the report's background framing is now — it does usefully capture that there are multiple layers and that you can't trust a self-asserted link because anyone can lie about who moderates them.

**Outcome:** Task Force stays scoped to `moderatedBy` plus a moderation inbox; the "host" concept is deferred to ActivityPub itself. Verifying the `moderatedBy` relationship is the central threat to solve (see below).

### Verifying the `moderatedBy` relationship (threat modeling)

The bulk of the meeting. The core threat: a malicious actor (e.g. `evil.com`) falsely declaring `moderatedBy: mastodon.social`. The system needs to verify that the named moderation actor has actually consented to moderating that actor. Echo agreed this is a real threat to model.

- **Echo's pragmatic position.** Almost every Mastodon server's `moderatedBy` will be the instance moderation account (which they'll create), and the main requirement is just a moderator-to-moderator inbox. Echo wants `moderatedBy` to become an FEP soon and prefers any signature requirement be `should`, not `must`, since the implementation cost is unknown and the naive approach (just send the report) works. Emelia argued for `must`, because a mandatory signature lets a receiver cheaply validate the relationship up front (fetch both actors, verify the signature) and refuse reports where the relationship isn't established. They weighed the storage/DB-size knock-on of persisting hashes per actor at large instances.
- **Option 1 — embedded signature on the actor** over `(actorID + moderatedBy actorID)`. Rejected for key rotation: rotating the moderation actor's key would require republishing an `Update` for _every_ moderated actor. Real precedent — [Kolektiva](https://kolektiva.social/@admin/110637031574056150) had to rotate every actor's key after a server seizure exposed an unencrypted database copy.
- **Option 2 — stamp / authorization object** (modelled on [FEP-044f](https://fediverse.codeberg.page/fep/fep/044f) quote authorization, which uses a `QuoteAuthorization` approval stamp): fetch a separate authorization resource to verify. a framed the trade-off as: a signature = one signature validation; a stamp = one HTTP request — choose based on what's cheaper at scale.
- **Option 3 — HTTP Message Signature on the response.** Sign the response that asserts the relationship, requesting a specific key/algorithm via `Accept-Signature`, so verification happens at request time and key rotation doesn't require touching every actor. Open question raised on the call: does [RFC 9421](https://datatracker.ietf.org/doc/rfc9421/) support signing _responses_? Section 4 / its use of "an HTTP message" (not specifically a request) suggests yes; the older Cavage draft 12 lacks `Accept-Signature`. Related gap: the Fediverse's current HTTP-signature usage specifies a key ID but not an actor ID, leaving the key→actor mapping unspecified (the `owner`/`controller` terms from the security vocabulary could fill this; GoToSocial reportedly uses owner/controller).
- **TLS / same-origin tangent.** a suggested relying on TLS host authentication plus a `Link` header (necessarily emitted by the host) pointing at the moderation actor: trust the host, trust the link, distrust the content. Emelia countered that ActivityPub software doesn't pin or record TLS certificates, and the remote origin can't be fully trusted anyway (e.g. HTTP-signature and domain-block spoofing previously demonstrated by a well-known person who likes to prove adversarial threats in the ActivityPub ecosystem), so same-origin/TLS alone doesn't satisfy the threat. `host-meta` ([RFC 6415](https://datatracker.ietf.org/doc/rfc6415/)) was rejected because nothing binds it to ActivityPub.
- **Collection filtering.** Filtering the moderated-accounts collection was considered and set aside as touching too much still-undefined territory (two ActivityPub API TF issues — collection filtering, [activitypub-api#55](https://github.com/swicg/activitypub-api/issues/55), and collection CRUD, [activitypub-api#15](https://github.com/swicg/activitypub-api/issues/15)). a noted you don't even need a collection — just a direct, verifiable statement that "this moderator moderates this user."
- **New W3C requirement.** Emelia noted W3C now requires published specs to include a threat model (the [Threat Modeling Guide](https://www.w3.org/TR/threat-modeling-guide/)), so the TF will need to produce one, and it must cover the actor-misattributing-its-moderator threat.

**Outcome:** Leaning toward a stamp/authorization-style approach (à la FEP-044f) combined with an HTTP Message Signature on the response, generated at request time, to allow key rotation without updating every actor. Open items: confirm RFC 9421 supports response signing and `Accept-Signature`; Echo to check internally whether signature support is cheap; capture the false-`moderatedBy` threat and candidate mitigation in a PR; produce a threat model.

### #121 / #129 — Granular moderation policies (initial report)

- a raised PR #121, which recommends allowing granular policies instead of binary mute/block actions, and considers it about ready to merge; it has been through multiple review rounds. PR #129 was grouped with it.
- The status of the "initial report" itself is uncertain: Evan had volunteered to write the ActivityPub features section but didn't, and time/resource constraints have stalled it. Emelia questioned whether to keep the initial report or fold it into another document, noting it needs more work overall.

**Outcome:** Deferred — #121 and #129 bumped to July's meeting; the future of the initial report added to next meeting's agenda. (No formal merge queue exists yet, since nothing has been merged so far.)

## Action Items

- [ ] Emelia: Investigate ReSpec PR-preview hosting for Task Force repos (e.g. OnRender) and available funding (#122).
- [ ] Emelia: Add the initial report / granular policies ([#121](https://github.com/swicg/activitypub-trust-and-safety/pull/121)) to July's agenda.
- [ ] a: Leave extended PR review on #116
- [ ] Echo: Check with internal team (Claire, David) on the `moderatedBy` signature / threat-model approach and report back next meeting.
- [ ] Echo: Follow up with European.social/others about collaborating on a common label vocabulary.
- [ ] Emelia: Document the false-`moderatedBy` threat model and possible mitigations (signature vs stamp/authorization vs response-level HTTP Message Signature).
- [ ] TF: Research whether RFC 9421 supports signing responses and `Accept-Signature`; decide whether to raise it with the HTTP signatures group.
- [ ] TF: Produce a threat model for the moderation work, per the new W3C requirement.

## Examples discussed

Content label with attribution to the moderation actor, published as an Update activity:

```json
{
  "@context": [
    "https://www.w3.org/ns/activitystreams",
    "https://w3id.org/fep/4c96"
  ],
  "type": "Update",
  "id": "https://social.example/notes/abc",
  "actor": "https://social.example/alice",
  "attributedTo": "https://social.example/moderation",
  "object": {
    "type": "Note",
    "id": "https://social.example/notes/abc",
    "attributedTo": "https://social.example/alice",
    "updated": "2026-06-07T12:00:00Z",
    "content": "<p>An example post.</p>",
    "tag": [
      { "type": "Hashtag", "name": "#example" },
      {
        "type": "Label",
        "href": "https://labels.example/vocab/nsfw",
        "name": "NSFW"
      },
      {
        "type": "Label",
        "href": "https://labels.example/vocab/spoiler",
        "name": "Spoiler",
        "attributedTo": "https://social.example/moderation"
      }
    ]
  }
}
```

Possible HTTP Link header for `moderatedBy`

```http
HTTP/1.1 200 OK
Link: </moderator>; rel="https://moderated-by.example/"

{
  "id": "https://social.example/alice"
}
```

The comparison to Linked Data Platform's inbox Link header

```http
HTTP/1.1 200 OK
Link: <https://inbox.example>; rel="https://www.w3.org/ns/ldp#inbox"
Content-Type: application/activity+json

{
  "inbox": "https://inbox.example",
  "id": "https://social.example/alice"
}
```

A possible "stamp" based approach to `moderatedBy`

```json
{
  "type": "Actor",
  "id": "https://social.example/alice",
  "moderatedBy": {
    "attributedTo": "https://moderator.example/team",
    "authorization": "https://moderator.example/authorizations/123"
  }
}
```

Another possible "stamp" based approach to `moderatedBy` (providing just the stamp URI instead of the actor + stamp)

```json
// https://social.example/alice
{
    "type": "Actor",
    "id": "https://social.example/alice",
    "moderatedBy": "https://social.example/moderator/authorizations/123"
}

// https://social.example/moderator/authorizations/123
GET /moderator/authorizations/123
Accept-Signature: ...

HTTP/1.1 200 OK
Signature: ..., keyId="https://social.example/alice#key123"
Digest: ...
{
    "id": "https://social.example/moderator/authorizations/123",
    "attributedTo": "https://social.example/alice"
}
```
