# 2025-05-13: ActivityPub Trust and Safety Task Force Meeting

## Agenda:

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Any updates from other meetings?
5. How to move forwards with content warnings (especially first-party)

We support contributions to the Agenda, please comment if there is something that we need to address during the meeting.

You can find information on how to join the meeting in the [SWICG calendar](https://www.w3.org/events/meetings/a54ae3c9-89bc-4bb1-b9db-e9494d2100e1/20250121T110000/)

## Attendance

- Jaz
- Emelia
- Darius (scribe)
- Denny
- a

## Content Warnings

- Emelia: On Apr 15 meeting, there was pointed discussion about content warnings, content labels, content annotation etc all being done through the Web Annotations spec, even if they are from the first party. For me the idea of someone who is the author of a post adding an annotation to their own post, while that is theoretically possible that doesn't serve a practical purpose. That should probably be excluded from the matrix of "can you do this". Which simplifies things to some degree. When we think of content warnings, content labels, and content annotations I don't think there is a one size fits all solution in the format of Web Annotations because that spec doesn't look like it's designed to handle all of these use cases. This is why the original ticket was split for content annotations to be its own thing separate from content warnings. For content labeling, that is something that a person should be able to do first party (this content contains nudity, etc) especially given things like the new UK Online Safety Act. It would give service providers a way to do things like filter certain kinds of content. We do need content warning in order to move forward with Artcles on the fediverse because the current state of Mastodon using `summary` causes a collision of concerns.
- Jaz: was the request for using the Web Annotations data model for annotations on statuses?
- Emelia: yes, there was one voice strongly stating that the data model should be used for content warnings, content labels, and content annotations. The theory is that web annotations works for all these purposes but when I ask for anyone to show use cases where it applies, I am left without an example.
- Darius: web annotations was designed for annotating documents on the web via a browser.
- Emelia: yes, it contains things like ways to specify text ranges on a document.
- Emelia: I think there is a difference between a content warning and a content annotation. A warning has specific user interactions desired as the outcome of it vs an annotation. Something like Community Notes for an annotation is "you see the post still but here is text provided by another user".
- Jaz: it seems to me that a content warning is just a label applied generally by the author. I've seen people ask for the ability to post hoc add content warnings. I think the data model could and maybe should be separate from the client action. And different clients can do different things with different labels and sources of labels.
- Darius: what is, data-wise, the difference between content warnings and labels/annotations?
- Emelia: Content warnings are free text. For labels, there would be something like a label vocabulary that is standardized.
- Darius: so content warnings would be text in a field; labels would be Objects that can be referenced and embedded in other contexts.
- a: so would "label" = "structured linked data reference", while "warning" = "unstructured freeform text"?
- Jaz: this sounds like we are formalizing the user experience we've observed for content warnings on mastodon, which I find unfit for purpose. The fact that one platform does something with collapsing... a well structured model for this stuff would allow for new emergent activites based on the data. I tentatively agree that a preference would be for vocabularies to exist that clients could make use of to help labeling and warning, but I am itching at the thought that we are formalizing an observed experience from one microblogging software. Instead of trying to put formality around the thing we see and the way it's seen in certain clients, if we unravel and rewind that and think about it from an agnostic perspective we can come up with a way to provide developers ways to come up with what they need while giving audiences more freedom too.
- Darius: I largely agree with Jaz. How does this work in ATProto with content labelers?
- Jaz: You bring your own vocabulary, and the PDS can apply some number of actions... hide, blur, warn, maybe some other things. Labeler A can say "depiction of war" and "blur" and Labeler B can say "war images" and "hide".
- Emelia: https://docs.joinmastodon.org/entities/Filter/#filter_action mastodon now has the same three actions with content filtering
- Emelia: the difference between a label and content warning is the former is structured linked data that can be referenced, latter is unstrutured freeform text. For labels you have structured labels, but I'm not saying there should be one vocabulary but many vocabularies. Bluesky has a base set of labels that they have defined, Mastodon would probably also want to have theirs.
- Darius: so a vocabulary should be an Unordered Collection of Label objects.
- Emelia: yes, you can see it in FIRES: https://fires.fedimod.org/reference/protocol/labels.html
- Emelia: I don't want us to be defining the labels. Just how you define the labels and share them, and how you associate a label with an object in the AP spec. You could cram all this into web annotations but I don't think that makes sense because we would be extending the web annotations vocabulary anyway since it doesn't have a notion of labels.
- a: What if there are two labels, one says "war" and one says "depiction of war"? Who gets to decide two labels are the same thing? Maybe we have a two-tier system where a label publisher can suggest that their label is a subclass or equivalent label.
- Jaz: no one really finds equivalences in that ecosystem. It's more just a choice of who people subscribe to.
- Emelia: right, we want to avoid string matching any more.
- Jaz: why don't we just adopt what is on the FIRES link you posted?
- Emelia: https://github.com/fedimod/fires/issues/68 issue on specifying recommended actions on content
- Darius: do we need to specify actions as objects?
- denny:  I don't see why specifying the action is within the ambit of a labeler's job. Wouldn't have occured to me as an application developer to look for action information in the label object.
- Emelia: I think you make it a string and we specify a set of starter strings
- Darius: are we reinventing mime-types here?
- Emelia: maybe we publish a repository of possible actions?
- a: we probably don't want to take on too much at the start, so as a group here maybe we focus on representation and discovery and back off of the "what happens to the label". It seems like we have the basic building blocks for representation. For labels that clearly the object reference type system as agreed on by some Actor (Person/Service/etc), and then CW is more of freeform text and explicit warning rather than summary. Maybe we leave actions out of step 1
- Emelia: I totally agree. I bunted on the idea of suggested actions for FIRES for that reason. I think it's something that can be added at a different point in time. For content warnings, they can just be a string. Given that the server is the publisher of the object, it's fine if moderators can add a CW toa post and not have it come from the end user. Whether you want to distinguish whether it was user vs admin, maybe, but that might defeat the point of a free text CW
- a: re: the question of who is applying a thing, you can add the attribution if it's a label. What matters is how you discover what applied the label. If it's by the publisher they can just say the attribution. If it's something you can discover, then you need to be able to discover where it came from.
- (discussion of: who created the label is different from who applied a label somewhere)
- Darius: so we have talked about Objects a lot but not Activity, so maybe the Activity tells us who is applying a label to an object, but the Object itself is just containing information about who created the label originally
- Emelia: so maybe we focus on Object scope for a current draft and we leave the Activity scope for the future. I don't think it would be useful for someone to say "I put a label on my own post" to be discovered through a side channel.
- Darius: we have 9 minutes left. Do we have action items we want to do?
- Emelia: the next step is to say there are two cases here. One is the content warning or label applied at authorship time, and the other is a content warning or label or other text applied after the fact.
- Darius: essentially first party vs third party labeling.
- Darius: is there a server Actor specified somewhere? Are we going to point to a big blank space and say "please specify this everyone"?
- a: there needs to be at least a way to say "this Actor is managed by this Service"
- Emelia: yes we need a way to say "which moderators are behind this Actor". we have an instance Actor that is a Service type, but hidden from users.
- a: there can be multiple such actors for different purposes. Most common is a proxy for signing http messages, there are relays, etc.
- Emelia: I think we should write a FEP.
- Jaz: in something Darius just said, we probably dont' want individual human moderators identifying. More like teams, institutions, etc.
- Jaz: for me a desired outcome is: `summary` returns to being a summary, and it can be a summary, or CW, or leadin to a joke, or whatever. It happens at authorship time and can and does serve that purpose now. A world in which people have authorship, a summary field they are free to use or not and software that interprets it how it wants, and we keep that separate from structured labels. We already tag our content with hashtags. I can see a world in which software clients give me the option to let me use the vocabulary of another server to help me tag my content. The larger point: I would love it if `summary` remained a summary and people can write whatever they want and that definitionally is not a content warning. Mastodon does the Hazard Tape and CW thing, but if we do this that could stop happen.
- Emelia: do we need an actual text property for content warning, or do we want the summary to BE the content warning?
- Jaz: why can't I personally write a `summary` of "Trigger warning: content includes blah" -- I use Trigger warning specifically because that's different from CW.
- Emelia: if we say `summary` is that, and then labels actually drive content warnings, how do you have software indicate "the author meant this as a CW" vs "the author meant to collapse".
- a: for collapsing, there's the `sensitive` property. Mastodon doesn't distinguish between `summary` and `sensitive`
- Jaz: let's take this out of mastodon and into a blog. What if a blog author writes warnings into the top of the post. That's fine. Let's have free text and have it not mean anything other than it's free text. We don't need a separate property for content warnings.
- Emelia: So perhaps expected behavior is: summary is free text; sensitive tells people whether things are collapsed or not; labels can be interpreted separately.
- a: i still think that `summary` can be correct even for content warnings, it's more about how much do we want to be able to signal the purpose of it? in AS2 it is defined as a "summary" in the sense that a plaintext representation of an object would have it be the secondary bit next to the name/title
- Jaz: I have found `sensitive` to be nonsense. maybe we just have it all be labels
- Darius: seems like `sensitive` is an example of the phase 2 "here is a recommended action"
- Jaz: with structured labels we are going to want actions.
- Jaz: can I get clarity. Emelia I think this is your contention, I am looking at FIRES labels. I think I understand that you won't or can't ascribe an Actor to the Activity of labeling a thing. I'm trying to wrap my head around how we do a spec where we talk about label discovery and representation but we don't add in who is responsible for applying labels.
- Emelia: we could add `attributedTo`. In the case of FIRES I don't need it because the label _is_ the provider of the label but for a more generic case we could.
- a: https://www.w3.org/TR/annotation-model/#motivation-and-purpose a Label could also extend from an Annotation, it can be multiple things depending on the properties you want it to have

## Outcomes

- It seems for now if you want `summary` to be a content warning with specific behaviour, then you should probably set `sensitive` to `true`.
- We have setup a small group who wants to work on defining a `Label` object type, which is likely based on the FIRES `Label` object type, and from that group we will publish a FEP.
