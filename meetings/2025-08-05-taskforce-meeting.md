## 2025-08-05: ActivityPub Trust and Safety Task Force Meeting

Attendance:
 - Darius Kazemi
 - Jaz-Michael King
 - Evan Prodromou
 - Emelia Smith
 - Julian Lam
 - a <trwnh.com>

- potential new meeting times
  - comment here: https://github.com/swicg/activitypub-trust-and-safety/issues/91
  - Idea was floated that we should move the meetings back to monthly, given everyone's availability now is different than it was in Sep 2024 when these meetings were made biweekly
- link preview CWing, marking link preview card media as sensitive?
  - link preview should be in a composer so you can see the link preview
    - problems with servers being the ones to fetch and render this stuff though
    - seems fine if there is an actual serialization of the link preview within the objects? but if people are generating their own link previews then what can you do to meaningfully stop that
    - right, but it makes sense to flag to a server what they might want to do or not
  - Evan: maybe this is an HTML/rel issue moreso than an ActivityPub issue
    - a: maybe a `rel="nopreview"`
  - as:sensitive has a specific range that doesn't include Link, it is Objects only so maybe that needs to be expanded
    - expand as:sensitive scope to `Object | Link`
      - https://gist.github.com/evanp/1321857549440c2de19f38e7019dec41
      - See: https://github.com/swicg/activitypub-trust-and-safety/issues/97
- issue with "indexable" flag
  - Julian: someone found out their profile was replicated on my site, and they were upset about it. It was suggested I use Mastodon's `indexable` flag to determine whether I can replicate. but it's not part of activitypub so I didn't want to do it. maybe if we standardize it, could it be useful for this?
  - Emelia: there should be some FEPs written for `indexable` and `discoverable`.
  - There should also be some advice around how to handle remote content when it is federated to you. Specifically if you're caching and showing it to viewers locally, you don't want to provide a duplication of that content to the world, it should only be served to authenticated users. In the case of Notes in the Mastodon context, it's easier to say "oh you want to share a link to a remote server post, we'll bounce you there". It's harder in the context of a thread view and you want to show those all in the context of the thread.
  - emelia: if you are going to redirect to the canonical version of a URL, you should have the interstitial that says "you are leaving our site" so that users don't try to log in to another site that might spoof your own login page. You need to break the flow to prevent phishing attacks. An interstitial can also provide extra context if a moderator has notes for the users regarding a certain external domain. We should publish an advisory on this.
  - Evan: maybe this is for core activitypub since it ties into so much stuff
    - Emelia: yeah, the T&S primer could be a start and then it gets imported into core activitypub
  - Emelia: AP spec as it stands right now doesn't provide much info about flag objects or guidance on federation management, spam, abusive usernames, impersonation usernames. Mastodon didn't have a way to say "if the username contains the word 'mastodon' anywhere in it don't allow it". Maybe these need to be in the spec or not, but they can go in a T&S report and then AP Spec can choose to bring it in or not.
  - Can you Flag a hashtag? Can you Flag a Link?
- Emelia: NLNet suggested that as a task force we could apply for funding from them. But what would that look like?
  - Evan: my experience right now is that funders want to fund software rather than protocols and documentation. But maybe reference implementations or validators?
  - Emelia: NLNet is interested in actively funding the task force
  - Darius: curious about how to fund this in terms of what organization applies for funding and how? Usually it's in kind where a company hires someone and spends their time doing things on a standards group. I wonder maybe a Mastodon or someone could apply and then use it as a funded position at the company.
  - Evan: "Fund a chair position to guide the TF to complete these deliverables: A, B, C, ..."
  - Relevant eligible activities [as per NLNet](https://nlnet.nl/commonsfund/eligibility/):
    * validation or constructive inquiry into existing or novel technical solutions
    * documentation for researchers, developers and end users, including educational materials
    * standardisation activities, including membership fees of standards bodies
- Julian: conversational contexts that put together objects based on reply association, there is an owner who has some sort of moderation power. There's a lot of discussions about it, there's going to be FEPs for: context inheritance (assuming a context that's not your own), context ownership.
  - Emelia: as far as how do I verify something that exists in a context collection, you fetch the object and that's the verification.
  - Evan: "attributedTo" should be the owner
  - a: +1 to context.attributedTo, that's who should be kept in the loop about a context
  - Evan: it would be nice if we had an endpoint to check membership in a collection so you don't have to fetch the whole collection
  - a: in general people should be doing this and there should be a FEP, but I don't know how would we deal with implementations that don't want to do the context thing.
  - Julian: right now anyone can identify themselves as being under any context. That's not going to change, and maybe we can get somewhere that you have to go through an ownership flow
  - a: I understand it's a potential inefficiency to fetch but I don't see it as a problem. This works right now for public conversations, not so much for private conversations (how do you prove something is in a collection provided you don't have the ability to fetch it outright)
  - Julian: yup, this is all very greenfield right now. TO Emelia's point about being able to remove oneself from a context, theoretically you should only be able to be added to a context by replying to something else in the context?
  - a: there's an implicit philosophical point here about when you reply to something are you consenting to be added to however many remote websites and thread views.
- Action items:
  - Evan: add an issue to expand the scope of as:sensitive to `Link` as well as `Object`
  - Darius: talk to w3c about funded task force work in general and report back
  - Evan: review and finish for the report any T&S features in AS2 and AP core
  - Emelia / Darius: Decide on a new meeting time & schedule.
