# ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith <@thisismissem@hachyderm.io>
- Evan Prodromou <acct:evanprodromou@socialwebfoundation.org>
- Julian Lam <@julian@community.nodebb.org>
- Dan Appelquist <@torgo@mastodon.social> - TAG co-chair & busybody
- Darius Kazemi <@darius@friend.camp>                   
- Andy Piper <@andypiper@macaw.social>
- Lisa Dusseault <@lisarue@mastodon.geekery.org>
- Estelle Weyl <@estelle@front-end.social>
- Wes Biggs <wes.biggs@projectliberty.io>
- Mike Waggoner <@herebox@social.coop>
- Andreas Savvides <@andrs.svds@threads.net>
- a <trwnh.com>
- Dmitri Zagidulin <@dmitri@social.coop>
- Christopher (he/they) <@yawnbox@disobey.net>


## Agenda

Mailing list notice: https://lists.w3.org/Archives/Public/public-swicg/2024Nov/0031.html

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions & Overview
4. Meeting times and cadence
    - Proposal: Every two weeks at 5pm CET on Tuesdays
5. Defining and agreeing on [Scope of Work](https://github.com/swicg/activitypub-trust-and-safety/tree/main?tab=readme-ov-file#scope-of-work) for the Taskforce
   - Proposal: Initially work on items related to long-standing federation issues:
     - Initial Report: document current usage/handling of Flag activities and similar general recommendations ( #
     - formalizing Flag activities ( [#2](https://github.com/swicg/activitypub-trust-and-safety/issues/2), [#3](https://github.com/swicg/activitypub-trust-and-safety/issues/3), [#14](https://github.com/swicg/activitypub-trust-and-safety/issues/14), [#8](https://github.com/swicg/activitypub-trust-and-safety/issues/8) )
     - discovery of moderation group actors ( [#24](https://github.com/swicg/activitypub-trust-and-safety/issues/24) )
     - content warnings / labeling, as to move away from misusing `summary` on `Note` ( [#1](https://github.com/swicg/activitypub-trust-and-safety/issues/1), [#4](https://github.com/swicg/activitypub-trust-and-safety/issues/4) )
     - define Block activity handling / sending for S2S, currently only defined for C2S ( [#23](https://github.com/swicg/activitypub-trust-and-safety/issues/23) )
     - communicating updates and conversations relating to Flag activities ( [#6](https://github.com/swicg/activitypub-trust-and-safety/issues/6), [#7](https://github.com/swicg/activitypub-trust-and-safety/issues/7) )
     - Explicitly out of scope, but we can include a recommendation in our report(s) about these if necessary: 
       - federation management, i.e., FediBlock, since "instances" are not a thing in ActivityPub, but just a side-effect of S2S.
       - quote posts (has [existing FEPs](https://socialhub.activitypub.rocks/t/disambiguating-various-interpretations-of-a-quote-feature-pre-fep/3426))
       - reply controls (has existing FEPs / implementations - [FEP-7458](https://codeberg.org/fediverse/fep/src/branch/main/fep/7458/fep-7458.md), [reply control discussions](https://socialhub.activitypub.rocks/t/fep-5624-per-object-reply-control-policies/2723))

Original agenda: https://github.com/swicg/activitypub-trust-and-safety/issues/26

## Minutes

Reminder of process, W3C account requirements and contributor agreements (links in agenda)

Code of conduct: this is not a group to work directly on moderation issues, nor is it about moderation policies of admins or platforms, but to work on the systems & protocols that can support moderation.

Introductions from the above people.

### Meeting times and cadence

RESOLVED: 5pm CET Tuesdays (the time of this meeting) is OK for recurring meetings.  

Evan reminded participants to use GitHub to help folks who have to participate asynchronously may do so. 
Staging process will be to be followed: https://github.com/swicg/potential-charters/blob/main/stage-process.md

Proposal: Meeting cadence every two weeks (same time)

RESOLVED: Meeting cadence every two weeks (same time)

### Discussion of Scope

Evan asked about bundling things in the scope together?  Emelia explained that Trust and Safety can have requirements on a number of documents, many of which might not be "owned" by the Trust and Safety TF.  E.g. Reply-control is being defined elsewhere but we can make recommendations to implementors about it. Similarly we aren't defining the S2S HTTP message signatures, but we can make a recommendation to use that.  

The scope proposed (in the agenda and at the link in the agenda) is roughly in priority order or order of work. The Flag mechanisms are somewhat under-specified.  We can improve those mechanisms.  Some examples:
 * Mastodon only accepts 500 characters in a report text, but misskey can send ~4000.  
 * Mastodon expects Actor in Flag reports although the spec isn't clear about requiring that, so flags without actor get dropped.  

Dan: something that might be useful, in the TAG we've been developing the [privacy principles documentd](
https://www.w3.org/TR/privacy-principles/) which primarily focuses on browser based APIs but it may be useful as a reference point because we've spent a lot of time defining terms and exploring this problem space. a lot of references. anything in there that could be useful, i would encourage you to reference it. E.g. [2.9 Protecting web users from abusive behavior](https://www.w3.org/TR/privacy-principles/#protecting-web-users-from-abusive-behaviour).

Emelia: we need some idea of where to send reports as well. right now we send them to an inbox and hope for the best, this inbox might even be the inbox of the person being reported! which is bad because it can cause social issues like retaliation.

Darius agreed with this and pointed to https://fediverse-governance.github.io/#9.-tooling-recommendations for research findings relevant to these goals.

Content warnings and labeling is a whole interesting area; we'd probably like to be able to label posts as containing adult content or violence.  Standard labels that others can reference can help others in the fediverse handle that content appropriately. 

Block activity handling isn't very well specified.  Does the blocked user's server get a Block activity?  We should define what we expect the behavior to be in the S2S part of the flow.

Evan in chat: Block is defined as a SHOULD NOT for delivery. https://www.w3.org/TR/activitypub/#block-activity-outbox
Yet some implementations do deliver Blocks. 

Communication about flag activity: should there be any way to reply to somebody who makes a report to reply - for acknowledgement, for requesting clarification, or for communicating outcomes?  There's not good communication between moderation teams, which results in friction.  Domains have been fediblocked due to poor communication already.   (Chat provided these relevant links: https://w3id.org/fep/7458, https://socialhub.activitypub.rocks/t/fep-5624-per-object-reply-control-policies/2723 )

Darius: [research-based recommendations from me on communication around blocks/flags](https://fediverse-governance.github.io/#8.-inter-server-admin-comms)

Quote posts and reply controls are very much wanted by folks in the Fediverse.  There is an implementation of reply controls and a few people are trying to get a FEP started.  There are 4 different ways of doing quote posts (misskey way, fedibird way, object links, and mastodon approach)  Each of these approaches have safety and privacy concerns about them. This Task Force wouldn't necessarily be defining these mechanisms but can help the groups defining these think through the T&S considerations. 

Federation management.  Since ActivityPub doesn't specify anything about instances, or say anything about Actors sharing the same instance, can we do anything about blocking instances. While the instance information is hidden, Evan thinks we could still consider something that extends AP.

Emelia proposes to work on flagging and reporting and communication issues first, before tackling changes/additions to the core models of AP in order to tackle defederating instances.  There have been proposals to share blocklists, but not sure we want to work on those right away.

a: We can have two parallel tracks to make good progress on these items.  One is the moderation track: we need have a clear context for where to even send moderation information, before we work on what is sent to moderators. (note that since Actors can in theory declare custom properties, at present an Actor can provide a moderation communication link that effectively goes to /dev/null... ). SO the moderation context (whatever signaling property gets used) needs to be clearly set by the server.

a: The other track can be content labeling and annotation.

Emelia: I think one of the very first things the group produces can be a report on how Flags work currently, before we start talking about the "Flag of the future"

Dan Appelquist says: suggest talking about the.g. "Tackling issues that improve trust and safety for Fediverse users by improving and clarifying the interfaces between instances." is the goal here to improve things for users? for moderators? for admins? i would suggest spending a bit of time to highlight this in the report because it can help sharpen thinking around the deliverables. i'd be happy to review if you want my input

Evan: maybe look into automatic detection for spam or keywords? ML models, etc. that can help surface problematic content. Something potentially useful to investigate.  Trust & safety can also consider the effectiveness of systems that don't entirely rely on human judgement and when it's a good idea to have a human in the loop.  

Emelia: [IFTAS CCS](https://about.iftas.org/activities/moderation-as-a-service/content-classification-service/) does PhotoDNA and automatic filing of reports with [NCMEC](https://www.missingkids.org/home)

Emelia: Some naive Bayes filtering "spam or ham" but should also have humans involved to make final decisions. For majority of fediverse, the human touch makes a difference in how we moderate our communities. Be very careful with overly algorithmic applications because that creates its own trust and safety issues. For example a model going awry can cut off people from their entire network of communication.

Wes: I think there is possibly a complementary interaction between proactive (automatic) and reactive (flagging, human-based) moderaton that could be well specified. 

Wes: Transparency is key. You want to know what is done by a human and what is done by an automated process.

Julian: Renaud from Mastodon mentioned that some systems can prevent spam from even being sent out in the first place -- disable registration if admins have been inactive, NodeBB uses an approval queue system for new content that can prevent spam from being federated out, etc. Main thing is the disparate ideas haven't been collated into one recommendation... a "best practices" section in a T&S report would go a long way

Emelia: Yes, fantastic point, we should probably create an issue for that and document it in our initial report

## Next Steps:

- Document Initial Scope of Work: [#27](https://github.com/swicg/activitypub-trust-and-safety/issues/27)
- Document Workstreams of the Taskforce (part of the above)
- Start collecting information for the Initial Report: [#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32)

## Addendum

- Estelle Weyl mentioned in chat "blocking of hashtags", an issue has been opened for that here: [#30](https://github.com/swicg/activitypub-trust-and-safety/issues/30)
- Placeholder issue for the Initial Report: [#32](https://github.com/swicg/activitypub-trust-and-safety/issues/32)

### Additional Reading Materials:

These were mentioned during the meeting as things people may want to read up on:

- Fediverse Governance Report, specifically on inter-server admin communications: https://fediverse-governance.github.io/#8.-inter-server-admin-comms
- W3C TAG's document on Privacy Principles: https://www.w3.org/TR/privacy-principles/#protecting-web-users-from-abusive-behaviour
