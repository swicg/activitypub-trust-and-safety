# 2026-02-04: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith <@thisismissem@hachyderm.io>
- Darius Kazemi
- Ben Pate
- a <trwnh.com>
- Denken Chen <@denkeni@mastodon.social>

## Agenda

1.  IP Protection Note Reminder:
    *   Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. [https://www.w3.org/community/socialcg/join](https://www.w3.org/community/socialcg/join)
    *   To contribute to Work Items: ensure you have a W3 account: [https://www.w3.org/accounts/request](https://www.w3.org/accounts/request), and sign the W3C Community Contributor License Agreement (CLA): [https://www.w3.org/community/about/agreements/cla/](https://www.w3.org/community/about/agreements/cla/)
2.  Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3.  Introductions
4.  On meeting time:
    - I know this may not be ideal for people on the west-coast US, we did recently change the meeting time and schedule to try to better meet the needs of attendees.
    - If we get more attendance frequently from the west coast, then we could figure out a new time, or do a A/B meeting series, where A is the first wednesday at current time and B is the 3rd wedneday at a new west-coast friendly time.
    - For background: [New Meeting Time #91](https://github.com/swicg/activitypub-trust-and-safety/issues/91)
5. Past Action Items
   -  #24, discovery of an Actor's moderators, exploration of the relation between user and service. We want claims about service relations to be verifiable by both parties to the claim. Related to allowing moderators to communicate with one another, formal Flag activity definition, and a few other ones.
7.  Discussion of additional moderation features, relating to this thread: [https://hachyderm.io/@benpate@mastodon.social/116292079719687939](https://hachyderm.io/@benpate@mastodon.social/116292079719687939) 
    - Related issues
        *   [Define/document how blocking works in S2S #23](https://github.com/swicg/activitypub-trust-and-safety/issues/23)
        *   [Improve Flag activities to include the categorisation of the report #2](https://github.com/swicg/activitypub-trust-and-safety/issues/2)
        *   [Improve Flag activities to differentiate the object being reported vs the evidence for that report #3](https://github.com/swicg/activitypub-trust-and-safety/issues/3)
        *   [Ability to allow moderators to communicate with each other #6](https://github.com/swicg/activitypub-trust-and-safety/issues/6)
        *   [Ability to communicate updates in response to Flag activities #7](https://github.com/swicg/activitypub-trust-and-safety/issues/7)
        *   [Idea: stable, opaque identifiers for originator of Flag activities #8](https://github.com/swicg/activitypub-trust-and-safety/issues/8)
        *   [Formally define the Flag activity for sending reports #14](https://github.com/swicg/activitypub-trust-and-safety/issues/14)
        *   [Addressing for moderation activities / Discovery of an Actor's moderators #24](https://github.com/swicg/activitypub-trust-and-safety/issues/24) **
        *   maybe [Ability for moderators to hide content without actually deleting it #64](https://github.com/swicg/activitypub-trust-and-safety/issues/64)
        *   [Ability to update a Flag activity that has already been sent to an inbox #73](https://github.com/swicg/activitypub-trust-and-safety/issues/73)
        *   [Idea: ActivityPub property to indicate an Actor is currently suspended / banned #95](https://github.com/swicg/activitypub-trust-and-safety/issues/95)

We support contributions to the Agenda, please comment if there is something that we need to address during the meeting.

You can find information on how to join the meeting in the [SWICG calendar](https://www.w3.org/events/meetings/29a5bd4f-bb6e-4830-bbf7-7ba290e89afa/)

## Past Action Items

- [ ] a: assigned to moderation activities (exploration of the issue of the "service" relation between a user and a service for the purpose of moderation) - [#24](https://github.com/swicg/activitypub-trust-and-safety/issues/24)
- [ ] everyone: review PR for flexible policies language in initial report - [#121](https://github.com/swicg/activitypub-trust-and-safety/pull/121)
- [ ] everyone: review PR for as:sensitive and content warning first draft - [#122](https://github.com/swicg/activitypub-trust-and-safety/pull/122)
- [ ] Indicating suspension status needs FEP/Proposal, a may work on that - [#95](https://github.com/swicg/activitypub-trust-and-safety/issues/95)
- [ ] Explainer on as:sensitive processing model — "Handling  sensitive content in ActivityPub" — [#118](https://github.com/swicg/activitypub-trust-and-safety/issues/118)
- [ ] Explainer on Content Warnings as they currently exist (summary + `as:sensitive` = content warning) — [#117](https://github.com/swicg/activitypub-trust-and-safety/issues/117)
- [ ] Initial Report: `Ignore` and `Block` in the vocab but do better ideally — [#60](https://github.com/swicg/activitypub-trust-and-safety/issues/60)

## Minutes

### Meeting Time
Exactly as discussed in the meeting agenda.

### #24 -- how to discover the moderation actor and where to send moderation activities

- Emelia: This issue is about declaring a relationship between an actor who uses a service and the moderation actor(s) for that actor.
- Emelia: In ActivityPub, we currently send Flag activities to the inbox of the actor being Flagged, which isn't great.
- Emelia: In order to solve this we need a moderation actor (a group) to send the Flag activity to, and also to support things like communication between moderation teams on servers. One requirement is that we must be able to verify that the actor is actually moderated by the actor that they claim moderates them.
-  a: We have a sort of theoretical framework right now where we know the requirements loosely, but we haven't gotten to the point where we have a concrete proposal. To recap: we need a bidirectional claim where the Actor says "I am hosted by this Service" and the Service says "I host this Actor". Previously there was a straightforward moderation Actor with a moderation inbox, but there's a vector of abuse if the verifiable relationship doesn't exist. There's a couple approaches you can use. One is to have a document somewhere you can check with filtering that says "Yes this Actor is served by me", or an endpoint. Not sure which is better -- if you have an endpoint you need to have it respond dynamically. Easier if it's just a stamp to check.
-  Emelia: I think for most cases we can say "here's the moderated Actor signed by the private key of the moderation Service" and have that somewhere
-  Ben: if I'm on a server, can't the server declare "this is the moderation inbox of the server" and anyone on the server is assumed to be part of that group. Why not use the hostname of the server for figuring this out? A way to discover the actor from the server
-  Emelia: yes but AP has no concept of servers, just Actors.
-  Darius: what if you want a third party service not on your domain?
-  Ben: I'll push back, you can find server names via webfinger
-  Emelia: yes but due to the spec we would really want to speak only of actors. We could have the moderated-actor's pubkey signed by the moderator-actor's private key. Or we could have a stamp like Mastodon's quote posts https://w3id.org/fep/044f
-  a: in HTTP we have hosts that form the identity of the network, but in AP we have Actor-resources. With an http host you can have lots of things on that host; webfinger is bound to host and well-known endpoints only work for the root of an http host rather than an arbitrary resource. you could have a scenario where alice.example is hosted by social.example or username.tumblr.com is hosted by tumblr.com but custom domains mean you can't always infer this visibly unless there is a link
-  Emelia: a consideration from the start was we can't have the moderation actor providing a collection of all the actors that they moderate. A spammer could use that to get a list of all the users on a server to send spam to. 
-  a: logically the collection can exist but its members should not be fully public. So you can filter a collection and ask "is this member part of this collection" and the server can respond "yes that user is one of the collection". That's the general pattern that's been used throughout activitypub services, where you use an as2 collection. We don't have perfect filtering or querying of collections right now, but you could adapt that into an endpoint by saying "here's a requirement on this endpoint, it must dynamically filter and respond with the user you're requesting". Which does not imply that it's the only user, just that the user is a member of the collection alongside unbound, unknown members.
-  Emelia: while I see the appeal of the collection approach, AP doesn't have the standard API for collection filtering but it's not there yet so wecan't rely on it right now. I think if we take the mastodon "stamps approach" used for quote posts where you request a resource and get a 404 if it's not there.
-  a: right now in AP we have the endpoints property which may be shared between multiple users. What's interesting about that is a lot of endpoints are useful to the actor but they represent a sort of pseudohost or protohost because you look at something like sharedinbox -- that's something that actors can simply claim it without verification. There could be a way to take the endpoints property and make it represent a host, in effect. You wouldn't want to leak all users but you could provide places where you could make verifiable claims about the user. There could be an endpoint that says "verify user moderator" and then you could pass it the actor id as a parameter and it would make that statement in the affirmative, or leave it out if it's not true. "Yes you asked about alice.example, alice.example is one of my users". We could reuse endpoints and make one a service to verify whether an actor is hosted or moderated by a specific host or moderation service.
- Emelia: I think we would be at an advantage to reuse the approval from the quote post FEP-044f, since that's now an established pattern in the fediverse. I don't think a custom endpoint is going to be something we can strictly specify. Every fediverse software I know of has different url structures and schemas
- a: yes, the stamp is equivalent to claiming `<service> <hasUser> <alice>` but indirect. the exact structure of the endpoint's response and the protocol that it uses to accept parameters is what's left open right now.
- Emelia: could we use Reject activities to Reject an incoming Flag activity for actors it doesn't moderate?
- a: i can put together concrete proposal(s) for next meeting, so we can review actual examples.

### #95, FEP for indicating a user is suspended possibly with additional information about the suspension

- a: didn't get to work on this, energy was spent thinking about moderation actors instead. current state is that mastodon has expressed not really wanting to do this, while nodebb has expressed interest. that's technically a nonzero amount of interest
- emelia: anyone interested in writing a FEP? perhaps a string that is either "permanent" or "temporary" where the presence means the actor is suspended and the absence means it's not
- Ben expresses interest in possibly working on the FEP. He'll review the issue and see if he's up to it

### Discussion of additional moderation features, relating to [this thread](https://hachyderm.io/@benpate@mastodon.social/116292079719687939)

- the thread was a call for tooling around T&S and around blocks. sharing blocks, publishing blocks, etc. we do have an issue open for this which is issue #23
- Emelia: blocking is currently only defined in C2S not S2S. Servers were sending Block activities, but certain servers were treating Block activities as badges of honor and publishing them. So servers stopped sending Block activities. I'd like to find some language where we could define a S2S Block activity, perhaps with a security note associated where "we do not recommend sending Block activities to untrusted servers as it can lead to harassment, you should only send Block activities to servers you have a trust relationship. We leave it to the server to define but here are some suggestions ____"
- Ben: I've done some abstract thinking around this. I recognize bad actors are always going act badly. But if there was the ability to opt in to publishing a Block either at the user or server level, and the server has other servers that are following it (via application actors) then perhaps there could be a way to republish blocks among the following servers. It would allow ad hoc networks to share that information. I've looked at FIRES but don't see an API I can implement if I want to plug my work into FIRES.
- Emelia: apparently I didn't publish the documentation for it. [this documentation](https://fires.fedimod.org/reference/protocol/) has a protocol for labelsets but not datasets, however the data model for datasets is published. I released an initial version of FIRES that was API-only where other software plugs into FIRES and all it does is the bookkeeping. FIRES is generally a sync protocol around collections, aligned to activitystreams. It introduces a few new object types.
    - Aside: Shawn (Oliphant) has been implementing FIRES from the client side so has knowledge here (in [Fediblockhole](https://github.com/eigenmagic/fediblockhole/pull/71) and [Apelago](https://archipelago.1sland.social/))
- Ben: I'll reach out to Emelia to get the missing piece here so I can start to implement. If there are places where other writing should be done, I am hoping to help with that.

## Action Items

- [ ] a: to write a comment on #24 on approaches to moderation actor relationships
- [ ] Darius: review #121 and #122
- [ ] Ben Pate: to tentatively write a FEP for #95 - https://github.com/swicg/activitypub-trust-and-safety/issues/95
