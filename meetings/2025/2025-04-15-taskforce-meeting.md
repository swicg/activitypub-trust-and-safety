# 2025-04-15: ActivityPub Trust and Safety Task Force Meeting

## Agenda:

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Quick issue/PR triage, if necessary
5. Discussion of first-party vs service-provider vs third-party content for Annotations, Labels, and Content Warnings
    - We essentially need to find some conclusion here that we're happy with, for example, inside a Note object, should the content only come from the Actor posting it? In which case moderator applied labels, annotations and content warnings wouldn't be possible on the Note itself, and we'd instead need some sort of side channel for these.
    - Annotations are very clearly third-party, and for that leaning on Web Annotations with maybe some lightweight ActivityPub integration probably makes sense.
    - For Labels and Content Warnings, these can be applied by the actor (first-party), the moderators (service-provider) and by third-parties, so depending on how we slice things, we may have two different ways of gaining this information.
    - I'm not 100% sure how a moderator would notify the network of a content warning or label being applied, and this would probably need some relation to "discovering the moderation actor" (#24).
    - I'd like to get to a FEP for content warnings by end of May 2025, since this is holding up work on bringing Articles more widely to the Fediverse.

We support contributions to the Agenda, please comment if there is something that we need to address during the meeting.

You can find information on how to join the meeting in the [SWICG calendar](https://www.w3.org/events/meetings/a54ae3c9-89bc-4bb1-b9db-e9494d2100e1/20250121T110000/)

## Attending
- Emelia Smith, @thisismissem@hachyderm.io
- Claire (Mastodon)
- Echo (Mastodon)
- Lisa Dusseault <@lisarue@mastodon.geekery.org>
- a <trwnh.com>
- Bob
- Angus

## Meeting Notes

These meeting notes are partial due to a lack of a scribe on the day.

### Introductions

- Joined by Claire and Echo from Mastodon

### First-party vs Service-provider vs Third-party content

Relevant Issues:
- https://github.com/swicg/activitypub-trust-and-safety/issues/1#issuecomment-2698559515
- https://github.com/swicg/activitypub-trust-and-safety/issues/4

a: does this matter per se? annotations can be made by anyone 1st/2nd/3rd party; the purpose of the annotation is more important, the fact that it is a separate object is more important. you can reference Annotations from the Note, there are two aspects really:
  - how are you discovering the annotation? fetch the Note and maybe it references an Annotation, or maybe there's an anno provider you trust.
  - is the annotation authorized / do you care to see it? if it's from the author then sure, if it's from the service then you need to signal that there is a service responsible for hosting this Note/Person, if it's an unrelated entity entirely then... well, it comes back to trust again.

Bob's position: We shouldn't invent something new when we have Web Annotations, which we can use as a general mechanism - rather than have custom approaches for each of the things we're trying to do with labels and content warnings.

Emelia points out that fetching content and then fetching and analysing a collection of annotations to see which ones are authoritative and whether any of them hold a content warning - before even posting a content warning - could cause delay in showing the note.

Angus: it's attractive not to invent multiple mechanisms for different things... perhaps you could also directly embed an annotation?
- a: you can!

Lisa: It depends how simple a solution for label and content warnings can be.  It could be much simpler than implementing Web Annotations for ActivityPub - which I point out is rather undefined, we've already talked about several very different approaches.  Implementing a simple solution for content warnings does not preclude doing Web Annotations later.

Bob: DOing the simple thing now and the right thing later...well often later never comes.  If we were to invent ActivityPub now we'd not just add these extra fields - we'd have an abstract model of objects, some of which are annotations of different types.

Emelia: Bob would you be interested in writing how to integrate ActivityPub and Web Annotations?

Bob: I'm not actually interested in adding Web annotations to ActivityPub. It's to provide annotations. If W3C annotations had become widely popular my opinion might be different.  I imagine how Web annotations actually becomes popular is by its attachment to ActivityPub. We should generate a profile of Web annotations to say what parts of it we use. We may differ from some parts of that spec - it doesn't require us to use it.  But it's wise to reuse.

Emelia:  The concept of annotations in T&S has been undefined.  Maybe we kind of have it already through quote posts?

Bob: We do have content warnings, IMPROPERLY, in the summary field.

Emelia: We do need to describe something such that content warnings stop using the summary field and we can use the summary field for its purpose.  If we decide to move content warnings to use the WEb annotations model, we then have to work to define all the integration questions between two different models/protocols.

Angus: What's our specific use case?

Emelia: When you author something you can add a content warning or label that is distributed when you publish it.  Content warnings or labels attached by moderators are distributed later.

Claire: Content warnings could be annotations but are not necessarily so. In Mastodon we design spoiler indications within the notes. I understand there are some use cases where annotations could be useful, like a moderator, but I'm not sure it's useful to generalize warnings into annotations that ANYBODY could write.

a: i think labels could be tags, but content warnings make sense to be annotations, either directly as a freeform text property or indirectly by pointing to an Annotation with oa:hasBody

a: the publisher (1st/2nd parties) can easily embed whatever property / resource they want... the challenge is only for 3rd party discovery

Bob: Why wouldn't we allow anyone to annotate a Note with a content warning. Something which is not NSFW in your area might be NSFW in mine. Shouldn't I be able to make that statement and shouldn't people who trust me be able to act on my content warnings?

Emelia: Possibly, but when the publisher states something that can be displayed differently by clients and user agents. I don't see any way of doing claim review (schema.org) in WEb annotations. Also where do you send it to and where do you fetch it from? I don't see how to do claim review with Web annotations because it attaches to a phrase, not a URI.

Emelia: Yes "NSFW" can be interpreted differently in different places.  Nevertheless, the user has an important opinion about their content.

Claire: A time when you want to add something like "NSFW" to somebody else's post, is in quote posts - quote posts themselves can have content warnings about the thing you quote.  This doesn't mean you SHOULD NOT have content warnings on somebody else's post, but it's not clear how it would work if you have a collection of annotations for everyone.

a: maybe we can draw up explicit user stories for this? "alice is a moderator and wants to let observers know that bob was banned for this post" is one such use case, "bob is making a post and wants to let people know before reading it that the post content deals with us politics"

Emelia: The Web annotations work has an assumption of sending annotations TO the publishing server. That's not what you want in a T&S context, where you want authoritative sources.  When a "COVID misinformation" warning is posted about a post, you don't want that to disappear just because the author disagrees. Where you store 3rd party annotations is a crucial point here.

Bob: No. Web Annotations allows you to say where you want the annotations to be stored, but it doesn't require that you store them there. It is simply a mechanism to advertise one location for annotations.

Emelia: Yes, WEb annotations can be stored in different places and advertised where, which is what we'd have to specify if we went in this direction.  In the case of content warnings, we have well-formed proposals already; very similar to what already works, and it gets us a little step forward.

Bob: Having the author of the content tell you where annotations should be stored, solves a problem of the WEb, (audio drops)

a: maybe we can draw up explicit user stories for this? "alice is a moderator and wants to let observers know that bob was banned for this post" is one such use case, "bob is making a post and wants to let people know before reading it that the post content deals with us politics"

a: also isn't this a matter of picking trusted sources? functionally the only difference in flow is whether the author/publisher acknowledges the annotation or not

a: what is actually "undefined" or is it more just a lack of understanding or familiarity?
