### Agenda:

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Small note from Emelia
5. Review of recent GitHub Activity: https://lists.w3.org/Archives/Public/public-swicg/2025May/0007.html
6. Update on FEPs

We support contributions to the Agenda, please comment if there is something that we need to address during the meeting.

You can find information on how to join the meeting in the [SWICG calendar](https://www.w3.org/events/meetings/a54ae3c9-89bc-4bb1-b9db-e9494d2100e1/20250121T110000/)

### Attendance
    - Jaz
    - Emelia (partially)
    - Darius
    - Lisa
    - Julian

### Notes

- Emelia: Just a quick note that sometimes I won't be available for meetings, or won't be fully focused during them, as I've some health issues that lead to significant fatigue and spontaneous coughing fits. In my abscence, please do continue to discuss issues or file new isssues, and take meeting notes (you can use hackmd and open a pull request with them, or drop the link to them to Emelia via email: emelia@brandedcode.com).
- Julian: next Forums/Discussion TF meeting, talking about the idea of having one reply tree across multiple communities and multiple categories. Who "owns" a tree when cross posting? Is it the author, is anyone, something else? Early discussions right now around writing a FEP. Many implementations have reply controls of some kind or another. 
- Julian: Mastodon FASPs for discovery... T&S thoughts?
    - Emelia: the FASP protocol is that only object IDs of activities are sent to the FASP, and then the FASP has to request those like an ActivityPub server would. From a user's perspective they can domain block a FASP if they want. The FASP is opt-in on a server administrator level, like a relay. FASPs are required to have terms of service and data sharing policies, and the UI might give you a snippet you can paste into your own Terms of Service when you subscribe to a FASP. Currently the only FASP that exists is a user discovery one. The FASP protocol already implements the latest version of HTTP message signatures RFC-9421. It will eventually be extended to do say T&S or media processing etc.
    - https://github.com/mastodon/fediverse_auxiliary_service_provider_specifications/
- Weekly digest overview (Emelia unless otherwise noted)
    - There's a bot that posts updates on all Github issues
    - FEP templates added to the Github repo so we can write FEPs inside the T&S repo
        - https://github.com/swicg/activitypub-trust-and-safety/tree/main/feps
    - Starting on a FEP for labels, based on work within FIRES
        - https://fires.fedimod.org/reference/protocol/data-model/labels.html
        - labels are applicable to many different use cases, and here we would like to apply them to Activities, basically a thing you can stick into the `tag` array on an Object. you might have a label that is "18+ content" and then you can `tag` your status with "18+ content"
        - labels are just IRIs and NOT centrally hosted, but the goal is to avoid duplication of labels where possible so we can agree on what a label is
        - Julian: while not identical, Piefed recently introduced "flairs" that are based on communtiies. https://lemmy.world/post/29042458
        - Emelia: yes, you could use the labels FEP for this but the primary use case is around trust and safety. the biggest problem we had with CWs was it was free text which makes it hard to filter on a content warning
        - Darius: what's the mechanism for deduplication?
        - Emelia: if 2 providers have the same label and they agree that the labels are the same they can use the JSON-LD "same as" semantics or "similar" or "subclass" type terms (not sure on the specific terms) and those could enable you notify that there is a "merge" or something
    - T&S TF is deferring to Mastodon on Quote Post safety since they put a lot of work into the T&S side of that. See https://codeberg.org/fediverse/fep/src/branch/main/fep/044f/fep-044f.md
    - Julian: please mention one of the Threadiverse communities like `@fediverse@lemmy.world` to announce the meetings
        - Emelia: you could make a pull request to the meeting template with the handles to mention, that would help us announce the meetings
- We also discussed the recently closed issues and some other issues that were pending closure.
    - The main point being to close the FediBlock issue as not planned: https://github.com/swicg/activitypub-trust-and-safety/issues/19
    - There were several rather general issues where the creator of the issue had not engaged further or there was no clear action to be taken, so these too were closed recently.
