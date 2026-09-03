# 2025-01-07: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith (thisismissem@hachyderm.io)
- Andreas Savvides (andrs.svds@threads.net - Meta / Threads)
- Lisa Dusseault (@lisarue@mastodon.geekery.org)
- Robert W Gehl
- Denny George
- Jaz (jaz@mastodon.iftas.org)
- Dmitri Z. (@dmitri@social.coop)

## Agenda

1. IP Protection Note Reminder:
>    Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
>    To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of Code of Conduct
3. Introductions, if necessary
4. Discuss: https://github.com/swicg/activitypub-trust-and-safety/issues/46

Original agenda: https://github.com/swicg/activitypub-trust-and-safety/issues/45

## Minutes

### [Trust and Safety is relative](https://github.com/swicg/activitypub-trust-and-safety/issues/46)
- Andreas: Main takeaway I had from this is they'd want some caveating that whatever we define here may not cover all cases, and folks may need to build on top of the protocol for their specific needs
- Emelia: Some post on Bluesky from a transgender woman talking about her experience, flagged as adult content, but in reality it was the linked content that was seen as adult content
- Jaz: Unless this group is making contextual recommendations, that has nothing to do with this group
- Emelia: That's why we should have a statement that if you are to employ automated moderated decisions, you should almost always have an appeals process or a human involved. Algorithms get things wrong.
- Jaz: If things that this group does leads to misuse of protocol or tooling, then it's in scope for us to say be careful, but seems contentual not in scope or relevant
- Emelia: Marked it as pending closure, if we're onboard with that then I am fine closing it
- Jaz: Suggest not closing, as it's likely it will be re-opened. Some of us from here can maybe chime in?
- Andreas: Agreed on not closing without action, maybe we can chime in for whoever has some input, and can probably look to cover this in our initial report and/or some context in a README of some sort
- Emelia: Yes we could look to try and capture this as part of the initial report.

### Other items pending closure
- [Issue 21, Quote Posts](https://github.com/swicg/activitypub-trust-and-safety/issues/21)
    - Emelia: Useful discussion in social hub, wanted discussion from this group too. We can make recommendations for quote posts, but defining them and how they work is entirely out of the scope of this task force. Can recommend implementing a certain variant, resistant to abuse, but seems very much so a "not our issue" thing?
    - Dmitri: I agree - cataloguing and suggesting seems like the best fit for this task force
    - Emelia: Have seen an early document on quote posts from Mastodon, it was shared privately, and it has extensively thought about trust & safety requirements for the feature.
    - Jaz: It sounds like we need to be very clear about what is out of scope for folks, we'll get a bunch more of these. Trust and Safety certainly includes misuse or malicious use of quote posts, or lists of words I don't like. I wonder if, to this point, we'll need some stock cut-and-paste "We don't do Policy / That's a Policy question / That's an implementation question"
    - Emelia: We have an "in of scope" section [in the README](https://github.com/swicg/activitypub-trust-and-safety?tab=readme-ov-file#scope-of-work), we can probably add a section for  what's out of scope?
- [Issue 47, Document out of scope work](https://github.com/swicg/activitypub-trust-and-safety/issues/47) 
    - We created this issue to document what topics are specifically out of scope so we can be efficient in keeping conversations on track.
    - Jaz: The work-streams that we're working on are all in scope only in so far as we're talking about examples.  We should say something that allows us not to drown in examples and conversations that have no end.  We may agree with people having conversations about those things but it's not what we're working on.
    - Emelia: How to word this: It's not in scope to define how AI/ML might moderate (one example of many).  the list of what is not in scope is very large
        - can we list some areas that are definitely not in scope that might commonly be asked about? 
    - Jaz: I shy away from detail; anything not in the list is conspicuous by its absence. 
    - Denny: More general language in the "not in scope" list is useful.  
    - Emelia: I would like some of this to be specific, because there are some very specific things (reply controls and quote posts) that are being worked on elsewhere, or are frequently asked.  
    - Evan: I don't see OUR community working on reply controls and it is a T&S issue.  Would we take on that work?
    - Emelia: It is a T&S issue but it's not one we're tackling right now.  Reply control goes beyond base features of the protocol.  WE can recommend implementing reply control and using the replies collection, however getting a FEP for that is out of scope of this group.
    - Lisa: let's distinguish between thematically in scope (which reply controls is) and actively on the work list.  I support a narrower work list as additional work items can always be added somewhere later.
    - Emelia: Let's say for now that we're in favour but not working on it. 
    - Jaz: Let's say we focus on how software that implements the fediverse needs to be supported to do generally acceptable trust and safety policy.  This isn't a research group and we shouldn't be writing policy, that should be evidence based if anybody writes it; this group is about trust and safety *in protocols* so people can implement what's right for their community.
    - Emelia: I want to say we as a group are *not recommending* AI/ML moderation; folks may use but we're not defining it.  Steering clear. 
    - Evan: Why would we even think it's close enough to being in scope, to need to say it's out of scope.
    - Jaz: What is out of scope is 99.9% of everything. Don't even be specific about what we're not talking about because that only invites talking about it. 
    - Specific wording might help come to agreement.  Moving on.

### Pull Requests

- [PR 43 - minutes from last meeting](https://github.com/swicg/activitypub-trust-and-safety/pull/43)
    - Merging
- [PR 44 - lead and co-lead](https://github.com/swicg/activitypub-trust-and-safety/pull/44)
    - Some wording changes and merging

### Next meeting

- January 21, 17:00 Berlin / 11:00 New York (same time), no change.

## Action Items

- Everyone: If you have input / thoughts on the [Trust and Safety is relative issue](https://github.com/swicg/activitypub-trust-and-safety/issues/46), chime in with your perspective
- Everyone: Capture what is out of scope
- [x] Emelia: Figure out what's up with the branch protection rules
- [x] Emelia: Merge the two open pull requests