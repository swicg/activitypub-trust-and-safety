# ActivityPub Trust and Safety Task Force - 2024 Meetings Summary

This AI Generated document aggregates the participants, action items, agreements, and discussed issues across all Task Force meeting notes from 2024 (`2024-11-12`, `2024-11-26`, and `2024-12-10`).

---

## 1. List of Participants

Below is the aggregated list of all participants across the 2024 meeting notes, including their contact details and affiliation information where provided:

| Name | Contact Information / Affiliation | Meetings Attended |
| :--- | :--- | :--- |
| **a** | `<trwnh.com>` | 2024-11-12 |
| **Andreas Savvides** | `@andrs.svds@threads.net` / Threads | 2024-11-12, 2024-12-10 |
| **Andy Piper** | `@andypiper@macaw.social` | 2024-11-12 |
| **Christopher (he/they)** | `@yawnbox@disobey.net` | 2024-11-12 |
| **Dan Appelquist** | `@torgo@mastodon.social` (TAG co-chair & busybody) | 2024-11-12 |
| **Darius Kazemi** | `@darius@friend.camp` | 2024-11-12, 2024-12-10 |
| **Dmitri Zagidulin** | `@dmitri@social.coop` | 2024-11-12 |
| **Emelia Smith** | `@thisismissem@hachyderm.io` | 2024-11-12, 2024-12-10 |
| **Estelle Weyl** | `@estelle@front-end.social` | 2024-11-12 |
| **Evan Prodromou** | `acct:evanprodromou@socialwebfoundation.org` / `acct:evan@cosocial.ca` | 2024-11-12, 2024-12-10 |
| **James Smith** | Manyfold | 2024-12-10 |
| **Jaz-Michael King** | IFTAS, `@jaz@mastodon.iftas.org` | 2024-12-10 |
| **Julian Lam** | `@julian@community.nodebb.org` | 2024-11-12 |
| **Lisa Dusseault** | `@lisarue@mastodon.geekery.org` | 2024-11-12, 2024-12-10 |
| **Mehdi Benadel** | `@mehdi_benadel@mastodon.balamb.fr` | 2024-12-10 |
| **Mike Waggoner** | `@herebox@social.coop` | 2024-11-12 |
| **Ted Thibodeau (TallTed)** | `https://mastodon.social/@TallTed` / `https://github.com/TallTed` | 2024-12-10 |
| **Wes Biggs** | `wes.biggs@projectliberty.io` | 2024-11-12 |

*Note: For the meeting on 2024-11-26, individual participant names were not captured in the notes due to missing HedgeDoc access.*

---

## 2. List of Action Items

### From Meeting 2024-11-12

- **Calendar Setup**: `@dmitrizagidulin` to set up recurring bi-weekly meetings on the Social Web CG calendar.
- **Document Initial Scope of Work**: Tracked via GitHub issue [#27](https://github.com/swicg/activitypub-trust-and-safety/issues/27).
- **Document Workstreams**: Document the Taskforce workstreams (part of issue [#27](https://github.com/swicg/activitypub-trust-and-safety/issues/27) and pull request [#39](https://github.com/swicg/activitypub-trust-and-safety/pull/39)).
- **Initial Report Data Collection**: Start collecting information for the Initial Report, tracked via GitHub issue [#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32).

### From Meeting 2024-11-26
- **README Workstreams Update**: Submit pull request to README to document independent workstreams: PR [#39](https://github.com/swicg/activitypub-trust-and-safety/pull/39).

### From Meeting 2024-12-10
- **Review & Merge Workstreams PR**: Review and merge PR [#39](https://github.com/swicg/activitypub-trust-and-safety/pull/39) (Update README.md to include scope of work).
- **Scaffold Initial Report**: Create initial structure/scaffolding for the Initial Report ([#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32)).
- **Volunteer Commitments for Initial Report**:
  - **Evan Prodromou**: Volunteered to write user stories on content warnings, labels, and annotations.
  - **Evan Prodromou**: Volunteered to summarize T&S features currently existing in the ActivityPub (AP) and ActivityStreams 2.0 (AS2) specifications (including Block and Flag activities).
  - **Task Force Members**: Submit suggestions for new sections for the initial report by creating an issue referencing [#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32).
- **Content Labelling User Stories**: Collect user stories for the Content Labelling workstream, tracked via GitHub issue [#41](https://github.com/swicg/activitypub-trust-and-safety/issues/41).

---

## 3. List of Agreements Reached

- **Meeting Schedule & Time**:
  - Agreed to hold recurring Task Force meetings at 5pm CET on Tuesdays (**RESOLVED**, 2024-11-12).
- **Meeting Cadence**:
  - Agreed on a bi-weekly meeting cadence (**RESOLVED**, 2024-11-12).
- **Holiday Break**:
  - Agreed to skip the meeting scheduled for December 24th, 2024, and reconvene on January 7th, 2025 (**RESOLVED**, 2024-12-10).
- **Taskforce Workstreams & Structure**:
  - Agreed that the taskforce will operate via multiple independent workstreams documented in the README via PR [#39](https://github.com/swicg/activitypub-trust-and-safety/pull/39) (2024-11-26, 2024-12-10).
  - Agreed to split initial technical focus into two parallel tracks: 
    1. *Moderation Track* (defining moderation context/signaling and inbox targets).
    2. *Content Labeling & Annotation Track*.
- **Initial Scope & Priorities**:
  - Agreed to initially prioritize long-standing federation issues: Flag activity formalization, moderation actor discovery, content warnings/labeling, S2S Block activity handling, and inter-server moderation communication.
  - Agreed that instance-level blocking (FediBlock), quote posts, and reply controls are out of scope for core protocol specification by this group, though recommendations/guidelines may be included in taskforce reports.
- **Initial Report Approach & Mandate**:
  - Agreed that the Initial Report will be a collaborative framing document with multiple sections (background context, existing AP/AS2 feature summary, best practices, cross-links to existing research) to establish context before finalizing technical workstream specifications.
  - Agreed that the "Best Practices" section will focus on practical recommendations and bare minimum features software should implement, avoiding rigid uppercase RFC-style `SHOULD` normative language.
  - Agreed to keep the taskforce's primary mandate aligned with ActivityPub protocol work and protocol extensions while addressing relevant sociological/governance context.

---

## 4. List of Issues Discussed and Results

| Issue / Topic | Referenced Links / Resources | Result / Outcome of Discussion |
| :--- | :--- | :--- |
| **IP Protection & Contributor Licensing** | [W3C CG Join](https://www.w3.org/community/socialcg/join), [W3C Account Request](https://www.w3.org/accounts/request), [W3C CLA](https://www.w3.org/community/about/agreements/cla/) | All substantive contributors must join Social Web CG and sign the W3C CLA. |
| **Code of Conduct & Group Mandate** | [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md) | Clarified that the group works on protocol and system specifications supporting moderation, not on platform-specific moderation policies. |
| **Scope of Work Definition** | Agenda issue [#26](https://github.com/swicg/activitypub-trust-and-safety/issues/26), Scope issue [#27](https://github.com/swicg/activitypub-trust-and-safety/issues/27), [Stage Process](https://github.com/swicg/potential-charters/blob/main/stage-process.md) | Scope defined and documented in issue [#27](https://github.com/swicg/activitypub-trust-and-safety/issues/27) and PR [#39](https://github.com/swicg/activitypub-trust-and-safety/pull/39). |
| **Formalizing Flag Activities** | Issues [#2](https://github.com/swicg/activitypub-trust-and-safety/issues/2), [#3](https://github.com/swicg/activitypub-trust-and-safety/issues/3), [#8](https://github.com/swicg/activitypub-trust-and-safety/issues/8), [#14](https://github.com/swicg/activitypub-trust-and-safety/issues/14) | Identified interoperability issues (character limit mismatches, Mastodon expecting Actor in `objects`). Decided to produce an Initial Report detailing current Flag usage before drafting future Flag specifications. |
| **Discovery of Moderation Group Actors & Inbox Routing** | Issue [#24](https://github.com/swicg/activitypub-trust-and-safety/issues/24), [Fediverse Governance Tooling Recommendations](https://fediverse-governance.github.io/#9.-tooling-recommendations) | High-priority item for Moderation Track. Addresses safety issue where reports are sent to general inboxes (including potentially the reported user's inbox). |
| **Content Warnings & Labeling** | Issues [#1](https://github.com/swicg/activitypub-trust-and-safety/issues/1), [#4](https://github.com/swicg/activitypub-trust-and-safety/issues/4), User stories issue [#41](https://github.com/swicg/activitypub-trust-and-safety/issues/41), [Shel Raphen's CW Article](https://shelraphen.com/on-content-warnings/) | Established dedicated workstream to move away from misusing `summary` on `Note` towards standardized labels (e.g. adult content, violence). User stories collection initiated ([#41](https://github.com/swicg/activitypub-trust-and-safety/issues/41)). |
| **Block Activity S2S Handling** | Issue [#23](https://github.com/swicg/activitypub-trust-and-safety/issues/23), [AP Spec Block Outbox](https://www.w3.org/TR/activitypub/#block-activity-outbox) | Noted that AP spec lists Block delivery as `SHOULD NOT` for outbox, yet server delivery practices vary. Taskforce will define expected Server-to-Server (S2S) Block handling. |
| **Inter-Server Moderation Communication** | Issues [#6](https://github.com/swicg/activitypub-trust-and-safety/issues/6), [#7](https://github.com/swicg/activitypub-trust-and-safety/issues/7), [Fediverse Governance Inter-Server Comms](https://fediverse-governance.github.io/#8.-inter-server-admin-comms) | Agreed to address lack of inter-moderator communication protocols which currently lead to domain fediblocking. |
| **Federation Management / Instance Blocking (FediBlock)** | — | Marked as explicitly out of initial scope since instances are an S2S side-effect rather than explicit AP objects. |
| **Quote Posts** | [SocialHub Quote Feature Thread](https://socialhub.activitypub.rocks/t/disambiguating-various-interpretations-of-a-quote-feature-pre-fep/3426) | Protocol definition out of scope; taskforce will provide T&S advice to other groups defining quote post FEPs. |
| **Reply Controls** | [FEP-7458 Spec](https://codeberg.org/fediverse/fep/src/branch/main/fep/7458/fep-7458.md) / [w3id FEP-7458](https://w3id.org/fep/7458), [FEP-5624 Discussion](https://socialhub.activitypub.rocks/t/fep-5624-per-object-reply-control-policies/2723) | Out of scope for specification development; taskforce will offer implementor recommendations. |
| **TAG Privacy Principles Reference** | [W3C Privacy Principles](https://www.w3.org/TR/privacy-principles/), [Section 2.9 Abusive Behavior](https://www.w3.org/TR/privacy-principles/#protecting-web-users-from-abusive-behaviour) | Recommended by Dan Appelquist as a foundational reference for defining terms and user protection principles. |
| **Automated Detection, Spam Filtering & Human-in-the-loop** | [IFTAS CCS](https://about.iftas.org/activities/moderation-as-a-service/content-classification-service/), [NCMEC](https://www.missingkids.org/home), [Fediverse Spam Filtering](https://github.com/MarcT0K/Fediverse-Spam-Filtering/) | Discussed proactive detection tools (PhotoDNA, NCMEC/NCII/TVEC, spam filters, approval queues). Agreed that automated tools must maintain human oversight, and anti-spam best practices will be documented in the Initial Report. |
| **Hashtag Blocking** | Issue [#30](https://github.com/swicg/activitypub-trust-and-safety/issues/30) | Estelle Weyl raised hashtag blocking; issue [#30](https://github.com/swicg/activitypub-trust-and-safety/issues/30) opened to track. |
| **Initial Report Framing & Scope** | Issue [#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32), [WCAG Guidelines](https://www.w3.org/WAI/standards-guidelines/wcag/), [Web Sustainability Guidelines](https://w3c.github.io/sustyweb/) | Discussed framing, duty of care (Jaz-Michael King), WCAG compliance models (James Smith), and leveraging existing research (Darius Kazemi). Resolved to produce a multi-section introductory report before workstream deliverables. |
