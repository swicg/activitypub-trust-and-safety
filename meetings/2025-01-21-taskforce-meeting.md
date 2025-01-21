# 2025-01-21: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith (thisismissem@hachyderm.io)
- Dmitri Z.
- Sebastian Lasse [@sl@digitalcourage.social](https://digitalcourage.social/@sl007) (he/they)
- bumblefudge (first time caller)
- Jaz-Michael King (https://mastodon.iftas.org/@jaz)
- Robert W Gehl (he/him) (@rwg@aoir.social)

## Agenda

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. FOSDEM Announcement
5. Review [#51](https://github.com/swicg/activitypub-trust-and-safety/pull/51)
6. Discuss [#4](https://github.com/swicg/activitypub-trust-and-safety/issues/4), particularly annotations (possibly, if there isn't more pressing concerns)

## Minutes

- Emelia: Introduced the meeting

- Emelia: First item on our list of things to discuss is pull request 51. It is a draft of what I think the initial report structure could be. 

- Emelia: Notes that the pull request can be previewed, and that previews only work for the initial report document at the moment.

- Emelia: So yeah, I'd like to go through that and seek feedback. If there's any comments, concerns, questions? 

- Emelia: I've written some of the text that I think should be in the initial report, obviously, it's an early draft. It's more the structure and what we want to make. I do think that the introduction is more or less the direction.

- Robert: I thought the structure looks very good. Seems to capture a lot of the issues that I've seen this group talk about. I imagine in the writing things could grow, but at least it's a good skeleton for me.

- Emelia: Yeah, one section that I did want to add, which is kind of inspired by the... recent post by Mastodon.art about Pixelfed is an absolute bare minimum requirements section. 

- Emelia: Which is like, you're building  Fediverse software, your absolute bare minimum requirements are, if you openly accept Federation with everyone, you be able to block instances by domain. Particularly inbound federation but also outbound. I think there's that and also ability to receive reports on your instance and ability send reports. I think that's it. Maybe there's additional things?

- bumblefudge: I would say maybe a list like that might be a good appendix. It would be helpful. It wouldn't fit in any of these sections the way they're organized? like an appendix if it gets too complicated or political or it's taking longer or deliverable because this is really non-normative and informational stuff. That's like more of like an the original document, if in its most extreme form. I would think of it as maybe just an appendix for now

- Emelia: We did definitely have some people ask for like a compliance document, something where they can go yep we checked all the boxes we have safety. I feel like that's something we can do, but I'm kind of thinking that it would be sort of under the guidance for building activitypub software section.

- Robert: I wanted to ask about those minimum requirements you mentioned, I assume the blocking requirement would be at the administrative level, but also the user level?

- Emelia: I think the absolute bare minimum would be at server level, but recommended to also have at user level domain blocking.

- Emelia: Yeah, because all too often we see new Fediverse software pop up online, without supporting any domain blocking at all. The free speech, pro-CSAM, whatever instances then send it a ton of content that they don't want to be legally liable for.

- Jaz: I think I agree, it's somewhat more operational than a report. I think it could be one of the most valuable output of this activity. Answering the question from implementers "what do I need to do, what boxes do I need to check". It should be a defined separate activity where we build the list of requirements and then separate them out into absolute must, should, nice to have, etc. rather than just sort of slinging it out because I think with some collaborative thought and engagement.

- Emelia: the structure here is not set in stone. If we want to change things around and move stuff about, we can absolutely do that. And have sections within section four where it's like absolutely required, recommended, etc and different items under those, if that would make sense. And yeah, we can totally collaboratively add items to this report, as necessary.

- Jaz: Asks where we could do such work.
- Emelia: Clarifies that it could be an issue on the issue tracker.

- Jaz: Do you remember that thing we did with Yoel Roth, and the Atlantic Council. In there was a big old table of moderation features and which platforms had them. I bet that might be a good starting point. I'd have to go find it.

- Emelia: Searches and finds the document as Securing Federation Platforms: security for collective risks and responses by Yoel Roth, Samantha Lai.

- Emelia: Shows the document to the group, notes that there's probably some stuff that isn't relevant in there.

- Jaz: Yeah, perfect, I bet that would be a starting point.

- Emelia: We do have the best practices recommendations for AP implementers issue at the moment and document proactive versus reactive moderation as issues, do we want an issue that is just safety features of the fediverse platforms issue.

- Jaz & Emelia agree on a new issue.

- Emelia: The best practice issue is here, this .list should collect everything together, but I don't know for sure. So if I'm missing stuff, please do let me know. I tried to collect everything together.

- Emelia: issue 33 here proactive versus reactive. If someone wants to write some stuff that would be great because we could also include that in this report.

- Emelia created the new issue [#53](https://github.com/swicg/activitypub-trust-and-safety/issues/53).

- Sebastian: I did already write it in the side chat that many of the other task forces want to do this primer pages in the wiki so that there is a clear starting point for every implementer. There is a section about abuse? Is there a separate issue tracker, otherwise the issues will land in the primer page issues?

- Emelia: Clarifies that we could link this report into the primer page later, once published, but probably not whilst we're still writing about it. Clarifies process around primer pages.

- Sebastian: Speaks about some off-topic content.

- Dmitri: My main issue with pull request [#51](https://github.com/swicg/activitypub-trust-and-safety/pull/51) is that it's a decent enough starting point, lets merge and then refine it. And we can move things around.

- Emelia: That's idea, I just wanted to go over the rough outline for the document and share where I'm at. The section about ActivityPub trust and safety features came in via Evan, but there isn't a whole lot of substance in the specification around those, so I'm not sure how we can expand that section. Would be interested in thoughts there.

- Emelia: Should we keep section 5?

- Dmitri: Yeah or get to it after the other stuff

- Emelia: Suggests removing Section 5, and when introducing the taskforce just reference the README rather than listing explicitly in the initial report.

- Dmitri: Yes, agree.

- Emelia: I'll add a note to remove section five and change the taskforce introduction.

- Emelia: I'll merge the pull request after I've fixed the few comments.

- Emelia: What did people think of the Introduction section? Am I on the right track or are we off track here? My general goal with that statement is to try and frame what trust and safety is, why we need it, and the sheer importance of it. Because obviously everyone reading this document isn't going to be an expert on trust and safety. So I'm trying to frame it in a way that is very approachable to people.

- Robert: That does make sense to me. And we can circle back on it later.

- Emelia: I'm trying to get something that just explains why this document exists.

- Dmitri: Yes, about introduction section, but one suggestion is to remove a sentence in the introduction.

- Emelia: Agrees, says that she does want to say something that if you just read the AP and AS2 specifications, you won't have enough for trust and safety.

- Dmitri: Yeah, so let's take that out and reword it.

- Sebestian: Speaks about stuff that's off topic, mentioning DMA and a Policy taskforce and the EU. Asking if that all covered by this group.

- Emelia: Clarifies that was off topic and not something that this group would deal with. Also clarifies that there's a code of conduct, so we don't discuss contributors employers' policies.

- Dmitri and Bumblefudge: agree that it's not our scope of work.

- Sebastian: *tries to reopen that conversation*

- Emelia: Repeats that that topic is not in our scope, and likely against our code of conduct (Sustained disruption of discussion - Continuing to raise issues that bring no new information when a group decision has already been made).

- Emelia: Continues the meeting and clarifies any next steps.

- Emelia: Moves on to the Annotations agenda item, since it was mentioned on the SWICG mailing list.

- The group agrees not to discuss further today, as it's a pretty big topic.

- Emelia: clarifies that all she wants to add somewhere is just that we focus on the protocol stuff, not on being the arbiters of truth or facts with regards to Annotations.

- Bumblefudge: recommends merging the pull request 51. Then other people can contribute sections.

- Meeting ends.

## Action Items

- [ ] Resolve comments on pull request 51
- [ ] Merge pull request 51
