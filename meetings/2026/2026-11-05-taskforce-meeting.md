#ActivityPub Trust and Safety Task Force Meeting Nov 5 2026

## Attending
- Victor Hernandez Guzman
- Julian Fietkau (@julian@fietkau.social)
- a <trwnh.com> (they/them, scribing)
- Evan Prodromou <acct:evanprodromou@socialwebfoundation.org>
- echo (Mastodon)

## Agenda
IP Protection Note Reminder:
Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
Reminder of Code of Conduct
Introductions
4. Plan for FEPS about content-labels originally owned by Emilia (PR 116).
6. Status of Sensitive Tag content (PR 122) owned by A. 
7. Sync about Best practices document plan. (Issue 161) owned by Roel
8. Moderation issues with E2EE

## Minutes

- Roel mention he wouldnt be able to make it. Report of progress will be offline.

### sensitive content

- Sensitive Tag work, by a, no update, PR for sensitive content is open.  No real pushback for this PR. a considers is ready to merge. Merge and becomes a report.
- Sensitive properties is non-normatively described on this document. Should we define it more formally, or leave it as an idea, or otherwise take it out?
- Evan proposed to merge the PR 122 for the sensitive content attribute first draft; can move to DRAFT status after this.

PROPOSED: merge PR for sensitive
RESOLVED: merge PR for sensitive (+1 votes: Victor, Julian, a, Evan, Echo)

- Voted to merge this. Victor will follow up on this.

### E2EE moderation

- unofficial draft report: http://swicg.github.io/activitypub-e2ee/
- Evan: mechanism for doing encrypted end-to-end messaging -- when a user sends a message to a user on the other side, the message is encrypted so that moderation isn't possible on the content of the message. We want to account for cases where User A might be harassing User B, where User B should be able to report that content, but this requires making the unencrypted content available in some capacity. We also want to avoid false reports, where User B fabricates problematic content from User A. Message franking allows for extra cryptographic information to prove that the message had the problematic content.
- E2EE needs 2 things: we need a description of the Flag activity, and we need the ability to attach franked content. Flag report should ideally cover this use case or allow for extension to cover this use case.

- echo: moderators being unable to see context can be especially problematic, taking reported messages out of context. We also lose metadata, not just content. Also, how are media attachments handled? CSAM and other legal liabilities?
- Evan: In many jurisdictions, moderators aren't responsible for what they can't moderate; however, once the reporting step occurs, I'm not sure.
- echo: Might be a nuance for the Flag activity
- Evan: Yes, this is a user story for the Flag activity I'd like to see considered, bringing it up for discussion here.
- echo: Not sure about the encryption side but a reporting activity should ideally provide a limited amount of context in order to be actionable. I understand the concern about E2EE and responsibility, but you said "most jurisdictions" -- there are a lot of jurisdictional changes in the air that might crack down on E2EE so I'm not sure how long we can count on that.
- Evan: Crosslink the moderation user stories and the issues within E2EE to T&S. Taking up a task to bring these user stories to the T&S TF. https://swicg.github.io/activitypub-e2ee/#reporting-content

## Next meeting

## Action Items
No new action items derived from this meeting. A PR about sensitive content was merged during the session.