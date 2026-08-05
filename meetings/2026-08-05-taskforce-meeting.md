# 2026-08-05: ActivityPub Trust & Safety Task Force Meeting

## Attendees

Please specify your name or pseudonym, affiliation if any, and pronouns, as this will help us take accurate meeting notes.

- a (they/them) <trwnh.com> (also scribing)
- bumblefudge.com (scribe/typo-generator)
- Emelia Smith
- [Ted Thibodeau Jr](https://www.linkedin.com/in/macted/) (he/him) (OpenLinkSw.com) // GitHub:[@TallTed](https://github.com/TallTed) // Mastodon:[@TallTed](https://mastodon.social/@TallTed)

## Administrivia:

1. IP Protection Note Reminder:
   - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
   - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Scribe volunteer(s)? If we can't find a scribe, I'll need to record the meeting and use AI/ML to prepare the meeting notes, or the meeting cannot proceed.

## Agenda:

1. Introductions, if necessary
2. Outstanding PRs
   - [#116](https://github.com/swicg/activitypub-trust-and-safety/pull/116) - Content Labels
   - [#122](https://github.com/swicg/activitypub-trust-and-safety/pull/122) - as:sensitive processing
   - [#142](https://github.com/swicg/activitypub-trust-and-safety/pull/142) - reorganisation of documents
3. Funding update
   - NLNet funding from Open Social Fund sponsored by Open Society Foundations & other donors
   - Funding for the last 7 months - already signed and approved
   - Funding for the next 12 months
4. Planning for the next 12 Months: https://github.com/swicg/activitypub-trust-and-safety/discussions/144
   - Review: [#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32) to reallocate any remaining work after we abandoned the initial report workstream.
   - We need to decide what we want to include in our funding for the next 12 months, in order to do that we need to figure out some workstreams, which I then need to allocate funding for via the Memorandum of Understanding.

## Minutes

- [#116](https://github.com/swicg/activitypub-trust-and-safety/pull/116)
  - emelia: walkthrough of contents
  - emelia: behavioral section may be cut/deferred to a future version if controversial or not agreed upon by the taskforce members.
  - emelia: feedback welcome on: behaviorial label ontology (not iterated, still in first draft, inspired by atproto equiv)
  - a: I'll drop some comments async
- [#122](https://github.com/swicg/activitypub-trust-and-safety/pull/122)
  - emelia: group consensus early on to avoid defining a new content warning property, simply describe the existing behavior and focus instead on content labeling
  - a: waiting on #142 outcome to rebase/re-generate respec preview
  - emelia: non-normative for now; just historical note for now, not on standards track. We could change our minds and have this find its way into a CG Report (maybe as an appendix?) later, which can then be brought to the CG for consensus.
- [#142](https://github.com/swicg/activitypub-trust-and-safety/pull/142) - [preview](https://pr-142-activitypub-trust-and-safety-taskforce.socialcg.workers.dev/)
  - emelia: reminder: we were originally writing all this as a initial report, but walked it back and made distinct notes and FEPs; thus parallel/ind. docs and PRs
    - scopes/merging:
      - emelia: we could merge some stuff around moderators and reports.
      - a: we probably want to keep documents separate instead of merging, but refer between documents.
    - addressing section 3 (wrong audience, e.g. sending an activity to an inappropriate target) <> 3.3 reporting problematic content
- emelia: contributor announcement: new tooling in this repo --> spec work related pull requests will now receive a comment with a rendered preview.
- funding update
  - emelia: NLNet has extended support for this work for another 12 months, some retroactive and some going forward, out of "open social fund"; details added to the repo for transparency (`main/documents/2025-11...`)
  - We received a small initial grant for the past 7 months of work, this is work already done or with someone already doing the work.
    - includes a line item for SWICG-wide tooling: hedgedoc, scribing, mailing list summary, etc
    - hedgedoc integrating with [authelia](https://www.authelia.com/)
    - looking to outsource/skillshare to mitigate bus problem
  - We have been approved for a second grant, which covers the next 12 months of work. We need to figure out what that work will be, such that I can try to determine appropriate amounts of funding for that work, as I need to submit an Memorandum of Understanding to NLNet for this grant.
- planning discussion [#144](https://github.com/swicg/activitypub-trust-and-safety/discussions/144)
  - possible interim/special topic call on 19th august 5pm cest
- Reviewing Initial Report workstream [#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32)
  - emelia: issues under "intial report" workstream need to be rehomed after we cancelled the initial report and decided on workstreams, or closed.
  - emelia: some issues don't fit cleanly into workstreams we have right now, we can create new workstreams.
  - a: does a workstream for "recommendations/considerations for service providers" make sense? it would cover the "best practices" issue #29 and suspended actors FEP. see https://github.com/swicg/activitypub-trust-and-safety/issues/151
  - emelia: I would say these are not things service providers can/should do, but rather the software that powers the service should implement. That is, whether you have one user (yourself) or many users, this document would cover all those topics. Some may not be relevant to single-user servers or other ways of using ActivityStreams 2.0
  - emelia: Would a workstream to take Interaction Controls to standards-track be worthwhile?

## Action Items

- [x] Emelia opened a discussion for interaction controls as a standards-track document: https://github.com/swicg/activitypub-trust-and-safety/discussions/152
