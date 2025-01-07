# 2024-12-10: ActivityPub Trust and Safety Task Force Meeting

### Participating

- Lisa Dusseault (@lisarue@mastodon.geekery.org)
- Darius Kazemi (@darius@friend.camp)
- Evan Prodromou <acct:evan@cosocial.ca>
- Jaz-Michael King (IFTAS, @jaz@mastodon.iftas.org)
- Emelia Smith (@thisismissem@hachyderm.io)
- James Smith (Manyfold)
- Andreas Savvides (Threads)
- Mehdi Benadel (@mehdi_benadel@mastodon.balamb.fr)
- [TallTed](https://github.com/TallTed) // Ted Thibodeau (he/him) (https://mastodon.social/@TallTed)

### Agenda

1. IP Protection Note Reminder
   * Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
   * To contribute to Work Items: ensure you have a W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/

2. Reminder of Code of Conduct

3. Introductions, if necessary

4. Review and merge Update README.md to include scope of work #39 if it hasn't already been approved and merged.

5. Meeting schedule over the holiday season: PROPOSAL: skip the scheduled meeting on 24th December, reconvene 7th January.

6. Discussion


### Minutes

* discussion of initial report
    * https://github.com/swicg/activitypub-trust-and-safety/issues/32
    * Evan volunteers to provide user stories on content warnings, labels, and annotations
    * Emelia notes that reading of the history behind content warnings is strongly recommended: https://shelraphen.com/on-content-warnings/
    * "Best practices" section https://github.com/swicg/activitypub-trust-and-safety/issues/32
        * Emelia: goal is to outline features we think would be the bare minimum things people should do in AP software for T&S
        * Evan: If we are doing different sections, do you want volunteers to take on different sections of the report?
        * Emelia: yes
        * _Addendum: the initial report is intended to have multiple sections and volunteers to collaboratively write those sections; this will become clearer with the initial scaffolding of the initial report._
    * To suggest new sections for the initial report, please make an issue and reference [issue #32](https://github.com/swicg/activitypub-trust-and-safety/issues/32).
    * Evan: I would like to see a summary of features defined in the AP spec and related suite for T&S. Key feature is the Block activity, but discussion of spam and Flag are also important. I am volunteering to do a summary of what T&S features exist in the AP spec. I could do it for the AS2 spec and Flag as well. 
    * (discussion of high-level outline for report, included at [issue #32](https://github.com/swicg/activitypub-trust-and-safety/issues/32))
    * James: Is the report looking to provide MUST and SHOULD compliance guidance that as an implementer I can get a list of?
    * Emelia: For the best practice section, it wouldn't use uppercase SHOULD-type language, but you should pay attention to it. For other sections, like AP features for T&S... in that section, we would want to include Block and Flag. There is a small spam section in the spec.
    * Jaz: Spam is the second-most asked for thing for help with in our IFTAS needs assessment. Also, we have been working on an 80+ page moderator's handbook for the past few months. It's not ready for prime time yet, but if there is interest, I could share it and you could take willingly from it. Third thing, are we constrained to things that can go into the AP/AS2 protocols? Are we branching out? What's the scope?
    * Emelia: We can make recommendations related to the protocols.
    * Evan: I think that things about other protocols or human processes like spam review is probably out of scope. Our mandate from the CG is AP T&S which is pretty broad, but I think the mandate is to keep it close to the protocol work.
    * Emelia: We, as a community, do need to talk about things like governance of servers as related to T&S. Those aren't protocol, really; they are sociological. I think if we give a purely technical report and produce purely technical artifacts, then we are going to miss a lot of the nuance that goes into T&S.
    * James: [WCAG](https://www.w3.org/WAI/standards-guidelines/wcag/) and the [Web Sustainability Guidelines](https://w3c.github.io/sustyweb/) are big lists of "to be compliant with this thing, you should do XYZ", and then those can feed into standards as well. For example, saying "I am compliant with WCAG 2.1" is very powerful. Then things that are missing can go into future versions. I wonder if that is a useful model?
    * Evan: Does this task force have a mandate from the CG to do T&S guideline work? That's a fine distinction, but Emelia is describing a very large amount of work and a big scope. Maybe dealing with protocol extensions that are T&S focused would be a better scope.
    * Emelia: We need to cover some of the background and context for why we are doing the work we are doing. We need to give not just protocol extensions — people would look at that and just go "okay, why do I need to do this?"
    * Darius: Multiple authors of multiple documents have given permission to use their work. Maybe we can turn this into a cut and paste thing, where we quote extensively from already written and researched work.
    * Jaz: What I'm hoping to see is an acknowledgement from the protocol that an implementation carries with it a duty of care to the end users that will be using the protocol. We have many implementations of ActivityPub in the world and nothing in the protocol says, "once you do this, there will be problems, and you have a duty to mitigate them." I think the scope should not have to reimplement T&S, I think we should make the connections. I love the WCAG model. Step one is connecting implementors who are coming into a free-for-all of 1:1 messaging and making them aware that they have a duty of care.
    * Emelia: The initial report is to frame the work, and the workstreams are to do the technical stuff. The report will have background, cross links to external reports, etc. I am not expecting that we would be writing a thousands-of-words-type document about T&S. It is a summary to get people thinking about the space.
    * Darius: Is it worth going backwards, and we do the workstreams work first, then go back up to the initial report?
    * Emelia: That would be more the final report. We do need to frame things first and put together the state of things. It's not the only doc; it's the first doc. The final report would tie everything together.
    * Evan: As a group, we are uniquely qualified to make protocol extensions and focus on the protocol and potentially influence the next version of AP with these features. I think the larger community would benefit more from us focusing on protocol than taking in larger conceptual issues. The best way for us to be useful to the community is to focus on workstreams rather than larger work.

### Proposals

Emelia: **Next meeting would normally happen Dec 24th, we skip it and reconvene on Jan 7th.**
Attendees gave +1s in chat, no objections

### Next Action Items

- [ ] Scaffold out Initial Report
- [ ] Collect user stories for Content Labelling workstream [#41](https://github.com/swicg/activitypub-trust-and-safety/issues/41)
