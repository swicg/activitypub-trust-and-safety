# 2025-06-24: ActivityPub Trust and Safety Task Force Meeting

## Agenda:

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. To be determined during the meeting (I have nothing planned)

We support contributions to the Agenda, please comment if there is something that we need to address during the meeting.

You can find information on how to join the meeting in the [SWICG calendar](https://www.w3.org/events/meetings/a54ae3c9-89bc-4bb1-b9db-e9494d2100e1/20250624T110000/)

## Attendees:

- Emelia Smith @thisismissem@hachyderm.io
- Evan Prodromou <web+acct:evan@cosocial.ca>
- Jaz


## Minutes:

- Emelia: Opened the floor to topics, as there was no fixed agenda. Evan starts conversation about MLS and E2EE taskforce trust and safety concerns.
- Evan: Mentions MLS work from the E2EE taskforce, one question that has come up is "work around reporting messages". Most platforms that are E2EE have a way to report messages to moderators. Questions:
    - How to send a flag activity for an E2EE Activity?
    - MLS doesn't have a built-in decrypt and flag mechanism.
- Evan: If we're revisiting flagging for unecrypted content, can we consider what would be needed for ecnrypted content.
- Emelia: There's two considerations here:
    1. Who is the intended recepient of the Flag: The instance admins/mods or the owner of the chat.
    2. If it's the instance admin/mods then it's probably a matter of needing to report it unecrypted and let them know that it will be viewable unecrypted. (if it's to work with existing systems)
- Emelia: There is still the problem of how to handle reporting of media, since that wouldn't exist unencrypted on a server somewhere, so you'd need to unecrypt and send it as part of the Flag activity to instance admins.
- Evan: The other question is does it make sense to have the conversation between the reporter and the instance admins encrypted as well?
- Emelia: We do have the notion of introducing a Moderation Actor (this actor is moderated by this other actor (a group)), so in that case, since MLS just needs a public key to encrypt, that moderation actor could receive encrypted messages. This **would not currently work** for the way Flag activities are currently set as these are sent to the reported users' inbox.

- Evan: Other question around MLS work, the W3C has a privacy group, and other groups, you can ask for horizontal review. Questions:
     - Should we ask for horizontal review from those groups
     - Can we get review from the task force for the E2EE work for trust and safety concerns.
- Emelia: Yes, that is something the taskforce can facilitate.
- Evan: What about server-side keyword filtering?
- Emelia: This would work if the server provides an API for retrieving these filters (Mastodon has this).
- Evan: Application of filters server-side would not be possible due to E2EE.
- Jaz: There may be lessons learned here from Matrix and how they handle reporting in a federated nature for E2EE.
- Evan: We are going to have an E2EE taskforce meeting, so perhaps we can include people from Matrix in that conversation?
- Evan: The other thing with reporting messages in E2EE, is that messages can be reported out of context, and the moderators won't necessarily have the context to assess the situation properly.
- Evan: There is also maybe consent issues around reporting an leaking information to untrusted parties.
- Evan: E2EE is not a license to be abusive or harassing or conduct illegal activity.
- Emelia: What is the consent flow for starting a conversation? Is it invite based, or can I just directly send you an E2E encrypted harmful message via MLS?
- Evan: MLS has an explicit group setup process as part of the protocol, and adding additional participants later in a conversation requires group consent.
- Emelia: Currently the issue we do have with unencrypted direct messages is that they can be sent without invitation / consent, which makes them a very good vector to abuse to be disseminated in private.
- Emelia: Next step is probably to start a cross-pollination issue in the trust and safety taskforce iterating these concerns, and reaching out to organisations like Matrix and Roost Tools who may have existing experience in this space.

_Evan has left the meeting_

- Emelia: One thing of note is that the Labels FEP will include the concept of labels that are broader than and narrower than a specific label.
- Emelia: How would that work in context to DTSP?
- Jaz: Is there no hierarchial organisation?
- Emelia: Not planned, unless there's a good schema for it we can use
- Jaz: There might be interest for a hierarchy for things like CSAM (broad) and then categories like AIG CSAM, Meme CSAM, etc.
