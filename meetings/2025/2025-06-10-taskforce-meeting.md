## 2025-06-10: ActivityPub Trust and Safety Task Force Meeting

### Agenda:

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Minor PR: https://github.com/swicg/activitypub-trust-and-safety/pull/89
5. Content Warnings
6. Small note on labels
7. Annotations
8. Addressing for moderation activities

We support contributions to the Agenda, please comment if there is something that we need to address during the meeting.

You can find information on how to join the meeting in the [SWICG calendar](https://www.w3.org/events/meetings/a54ae3c9-89bc-4bb1-b9db-e9494d2100e1/20250610T110000/)

### Attendees
- Emelia Smith, @thisismissem@hachyderm.io
- Darius Kazemi, @darius@friend.camp (scribe)
- Evan Prodromou <acct:evan@cosocial.ca>
- James
- Amy B
- a <trwnh.com>
- Nik
- Ozoned

### Meeting Notes

- Introductions:
    - Ozoned: Runs Fireside Fedi podcast + a non-profit in the fediverse called BT Free.
    - Nik: Maker of the Pachli client application, which has some additional trust and safety features.
    - James: works on manyfold and was needing to figure out content warnings and want to send in summary.
    - Amy: I'm here representing Sex Workers and just wanting to learn more

- Content warnings
    - Emelia: at a previous meeting we decided that the usage of `summary` is appropriate for content description, and that content description is likely to include content warnings. We talked about a `contentWarning` type or text property, but landed on the use of `label` objects (in the `tags` array perhaps) and/or `as:sensitive` for the collapsing behavior. The `label`s are well-defined categories. Different orgs can publish different labels and consumers can choose to apply them. We can also deduplicate and say for example that "spider" and "arachnophobia" labels are the same using `sameAs` vocab.
    - Evan: in general it's a good plan. 2 issues. First issue is that a well-written summary will usually include a lot of details about the content. The summary of a NY Times article might include a summary to shooting, war, and so on. There may be traumatic content within a summary. Using a label as a preference that says "guns, violence, war" etc would be helpful for keeping me from dealing with the content in the summary. I would prefer to see other properties used as the warning before using the `summary` with the summary as a fallback if there's nothing else. The second is that there's a concept of "what is this thing about" or "what is under discussion" and so on. RDF has a lot of properties that cover these things. I mentioned dc:terms which is the Dublin core terms. Schema.org has similar and are worth looking at them before defining a new `label` property. My third thing is that using a controlled vocabulary is important for known issues like war, violence, and so on. Our species is creative in creating new traumatic issues or becoming more sensitive to issues that had not been previously identified as traumatic. Being able to support free text labels, we need to be able to include free text labels before they are added to a standard vocabulary at some point. Using a standard vocabulary as the primary description, and falling back to free text.
    - Darius: I am largely in agreement with all that! I think there's no major difference here. We very much want labels to be the first line of defense followed by text fallback
    - Emelia: also note that a publisher like a newspaper could publish their own list of topics for labels, specifically for recent news topics that people may want to filter.
    - Jaz: one concern I have from what I'm reading and hearing here is that some of the conversation sounds like the tail is wagging the dog. We want to collapse something so we will instantiate labels etc -- the notion of collapsing content in the user interface should not be driving things. The second thing is I have longstanding concerns with `as:sensitive`. In a well structured context, sensitive should be a property of the label itself, because sensitive is the eye of the beholder. We don't want the author to ultimately decide that something is sensitive, it should be the user. Finally, are we talking about self-labeling here? Is this a first step toward third party labeling?
    - a: Separation of concerns:
        - `sensitive` = author intends for this to be collapsed... "viewer discretion advised"
        - in the absence of anything else more appropriate, `summary` is fine to show "above the fold"
        - if we want to define a more explicit property for "above the fold" use cases, then it should have clear semantics
        - crucially, the author does not decide for the reader what the reader does, but they can provide enough information for the reader to make intelligent decisions for themselves
    - Emelia: Yes, that is correct @jaz, we're first tackling first-party labelling (i.e., the author applies a label at time of writing), then later we'll deal with third-party labelling via annotations.
    - Evan: I see `as:sensitive` as an expression of care for the audience. "I would like to make sure your software obtains your consent before showing this content to you". It's an additional consent layer built in to the system, it's not sufficient, but it's a first step.
    - Emelia: I would agree with `as:sensitive` being "viewer discretion advised". What we could have with labels is something that says whether a label _implies_ `as:sensitive`. For example, "18+" may have a default viewer discretion advised, but not a different topic.
    - a: the way we treat sensitive is a negotiation between the author and the reader. The author says "you might want to collapse this" and the reader can do that or not. The thing is, for people who want to have that clickthrough or collapse, we need to give them enough information that their software can make that decision. If the experience is that we want to have above-the-fold behavior intended by the publisher, the publisher needs to be able to put structured and unstructured data. Right now the unstructured data is `summary`. I think there should be another property that overrides above-the-fold content like maybe `sensitiveDescription`. Labels might also need to determine above-the-fold behavior (via something like `sensitiveLabel` as structured references), not just "watch out before you read this" but "watch out before you read this because it is about this thing specifically".
    - Emelia (in chat): I'd probably say if the Note is `as:sensitive`, and has `Label`'s applied via `tags`, then you'd probably collapse with the list of label names
    - Jaz: my second point, which reasserts this, the notion that `as:sensitive` is an expression of care. The term for that is "trigger warning", and there is good academic work on this, that trigger warnings always describe the content in brief. Again I heard this notion of collapsing. I'm curious, what outside of my limited understanding of how sensitive gets used, how does this apply to longform, pixelfed, video, and so on? I keep hearing "person A sets up a list of things and person B says I want to see this and not that". Not that I want to impede any activity here but how much is collapsing important? We keep talking about it, but it means we are only codifying a not-great answer to a really important problem.
    - Emelia (in chat): This is what we envision with labels, the bluesky style labelling and choosing what you want to see (filter it out completely, blur it, add a warning, etc).
    - Darius: I think the unspoken assumption here is that if we have enough data that we can do logic to collapse things, then that is sufficent for any number of other policy applications including "simply don't show this", "hide it", "report to moderators" or whatever else
    - Evan: One antipattern I'd like to avoid in this architecture is one where an image or text is offered to the audience and because the author knows the summary is to be used as a content warning, they _do not_ give a good description and just say "content warning: spiders" rather than a good description. This would mean we have less semantic information that comes across the wire. It's been an antipattern with Mastodon so far. One concern with "the content warning is in the summary" would be the content warning overtaking the summary
    - Darius: I agree, and I think as a spec we need to make it clear that software SHOULD make it clear that the summary field is for content _description_, and that the content warning can be a natural part of that if they want.
    - Evan: we do see the CW structure used for features that aren't content warnings. For example, joke setup in CW and joke punchline in the text. We should tease out that show/hide from the labeling, describing, and so on. that might be one way to overcome the issue by adding a show/hide mechanism in content, perhaps via HTML or something.
    - Emelia: that's `<details>` and `<summary>` actually!
    - Nik: I am wondering if the ideas you're talking about would allow for the idea of following a user but only their content about topic X or Y
    - Darius: short answer yes, you can apply any policy you like based on this metadata.
    - Emelia: longer answer, there's no way to follow someone and say "I only want to follow this subset of your content"
    - Darius: there's nothing here that prevents things from hitting your inbox, it's more about having the data to take action on the stuff hitting your inbox
    - Nik: so could an Actor label itself "NSFW" and software decide to reject all activities from that actor?
    - Emelia: yes, and there is a need to be able to label Actors as well as Activities. A sex worker may want to label their Actor "18+" but have individual conversations about politics because that's an important thing to them.
    - Darius: yes, there is a ton of business logic on the application/server/client level that would be more complicated than what is being proposed here. but these labels are necessary to enable that work.
    - Evan: I understand that labels can be used for content warnings, but I'm having trouble seeing what the problem is with having a `contentWarning` property that is free text.
    - Emelia: we could add this text property, but then the question is what do I prefer? There's `summary`, and a `contentWarning` or whatever field. What we ended up coming up with was that the content in the content warning would already be in the summary for longform, and for shortform, I think you'd use `summary` for short text including content warnings.
    - Jaz: absolutely agree with Evan, we should have a new property. 2 small points of order: I've had a realization that the gap I keep feeling is we keep talking about author and reader, and we don't talk about author, service provider, or host. I also back Darius' scaffolding, there are a bunch of things we can do with this stuff and we are close to MVP and we can ship something and we can get on with making the software and tools.
    - James: having a simple content guidance field would be good, and structured data is necessary, but it's boiling the ocean. Where do you stop? It's a good thing to do but it shouldn't hold up a small improvement.
    - Darius: I think my experience is I've been bonked on the head in standards meeting for proposing new fields so I kind of assumed everyone else knew better than me and we shouldn't have a free text field. I still would like a free text field.
    - Emelia: Summarising [this comment from Renaud](https://github.com/swicg/activitypub-trust-and-safety/issues/1#issuecomment-2769502144) on the Mastodon team: What does a transition period here look like? How does software that `summary` previously used it as a CW indicate that it's no longer a CW even though `summary` is present? There will likely be a several year long transition period, we will need to support things through a deprecation period. What about post-hoc ingestion years later where the semantics have changed? This is where Annotation providers could provide labels for historical data.
    - a: transition period:
        - producers can choose to send a summary containing whatever natural language representation they want (it can start with the literal string "cw: foo" and then append whatever)
        - consumers will need to start recognizing the new properties
        - some consumers will unfortunately continue to only expect `summary` as a CW, there's nothing we can do to make them stop doing that
    - Jaz (in chat): if we are overly-cautious of guiding change management, we won't be able to change very much. Transition will easily be 12, 18 months. But it needs a frist step and good people to guide aned inform the process.
    - Evan: one maybe nice part is a universe in which `summary` is used as CW is a universe where everything is a `Note`. Summary is usually unneeded in the Note space, which is probably why it was used for CWs in the first place. As a long term mechanism it seems like there's a direct way to fence around Notes, with `summary` as a CW fallback, but maybe we produce summary+CW for a while. We don't want to enshrine summary as the CW as we are supporting richer and more interesting content types like video, audio, and so on. Those are places where we need a text description

### Decisions / Action Items

1. We move forwards with the Labels FEP
2. We add a FEP for a free text content warning. (name TBD), and that FEP should talk about order of application / priority

These were agreed on by the following attendees:
- Evan P. (+1 but I think it should be a CG report, not a FEP )
- Darius K: +1
- Jaz: +1
- Emelia S: +1
- a: +1 (+1 a FEP or scope expansion to include structured references)
- James: +1

Abstain:

- Nik
