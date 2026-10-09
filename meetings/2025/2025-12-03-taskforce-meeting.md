# 2025-12-03: ActivityPub Trust and Safety Task Force Meeting

## Attending

- Emelia Smith (@thismissem@hachyderm.io)
- [Ted Thibodeau Jr](https://www.linkedin.com/in/macted/) (he/him) (OpenLinkSw.com) // GitHub:[@TallTed](https://github.com/TallTed) // Mastodon:[@TallTed](https://mastodon.social/@TallTed)
- Julian Lam (@julian@activitypub.space)
- Eugenus Optimus (@ujeenator@ujeenator.net)

## Agenda

1. IP Protection Note Reminder:
    - Anyone can participate in these calls. However, all substantive contributors to any Taskforce Work Items must be members of the Social Web CG with full IPR agreements signed. https://www.w3.org/community/socialcg/join
    - To contribute to Work Items: ensure you have a (free as in beer) W3 account: https://www.w3.org/accounts/request, and sign the W3C Community Contributor License Agreement (CLA): https://www.w3.org/community/about/agreements/cla/
2. Reminder of [Code of Conduct](https://github.com/swicg/activitypub-trust-and-safety/blob/main/CODE_OF_CONDUCT.md)
3. Introductions, if necessary
4. Meeting Schedule
5. Grant Application
6. Past Action Items
    - [x] Emelia to coordinate with Dmitri to update the calendar.
    - [x] Darius: talk to w3c about funded task force work in general and report back (carried over)
    - [ ] Evan to follow up on Mailing List / GitHub with ideas on funding.
    - [ ] Evan: review and finish for the report any T&S features in AS2 and AP core (carried over)
7. Content Labels FEP Status


## Minutes

- Intros - none necessary
- Scheduling
    - Now monthly, 10AM Eastern Time (4pm Berlin Time, 7am Seattle) on first Wednesday of the month
    - Calendar is now up to date, update your calendars!
    - Subscribe to the new meeting:
        - https://www.w3.org/events/meetings/29a5bd4f-bb6e-4830-bbf7-7ba290e89afa/
        - (Unfortunately this is distinct from the past meetings)

- Grant application
    - Not much (or any) feedback recv'd in GitHub issue
        - https://github.com/swicg/activitypub-trust-and-safety/issues/102
    - Application has been submitted to NLNet
        - Applied for EUR 25k
        - Fund: thought about Fediversity but applied to the Open-Call instead, NLNet will correctly choose which fund suits best.
        - Synopsis: T&S working to improve T&S for projects built on AP, has been operating for 1.5 years (sep 2024) and funding will enable quicker progress on:
            -  Content labelling
            -  3rd party labelling (via third-party annotations)
            -  Moderation actors & discovery of them
            -  Enabling discussion of reports between servers; required spec work
            -  Categorisation for reports (`Flag` activities) such that reports from remote servers do not show up as "other", and so servers can advertise the categories of reports which they will accept. e.g., an adult community doesn't want to be bothered with a report for "nudity" because their moderation policies specifically allow it.
            -  Community notes for things like misinformation, public health, etc (some prior art w/ web annotations, probably third-party annotations)
            -  Best practices for AP implementors: https://swicg.github.io/activitypub-trust-and-safety/initial-report/
        -  Budget usage:
            -  Fund members of the task force to write specs and docs
            -  Allocate funds to management of TF meetings
            -  Hire a scribe for the meetings, since meeting notes has been a point of contention in the past.
            -  "Not Emelia's grant, but the TF's grant"
            -  There will be at least one meeting dedicated to writing & deciding on the MoU.
        -  Julian: "why 25k, not the full 50k?"
            -  Emelia: "wanted to be conservative", this is the first grant application so wanted to aim for enough to get the work done, but not too much that we'd be rejected.
            -  Julian suggested applying for larger amount and putting in line items for implementors to create proofs of concept
            -  Emelia would prefer to leave the funding for direct taskforce work for risk mitigation purposes
                - Since reliance on 3rd party implementors might end up with money left on the table; which looks bad for NLNet and T&S TF
        -  Risk for the grant application: There is another team that have applied multiple times for funding of trust and safety work, however, they have repeatedly been rejected, I tried to learn from their experiences:
             - T&S application: focus on concrete deliverables, less on abstract research or ideas.
            - 🤞
        - European focus: Emelia applied instead of Darius. Darius will be added as an administrator on the grant, since he is co-chair.

- Content Labelling FEP
    - Emelia can finally work on writing FEPs, as she has some funds available thanks to the FediMod FIRES grant paying out.
    - Julian notes (as an aside) that CWs are not implemented in NodeBB due to lack of guidance
        - Emelia: CWs can be implemented as per how Mastodon implements
        - Understandably this is difficult since CW spec is a moving target
        - Emelia: The "FEP" for content warnings is: "Use `summary` to as a summary, if `as:sensitive` is true, style it as a warning of some sort / signal that there may be danger ahead"
        - `as:sensitive` is defined in [ActivityPub Miscellaneous Terms](https://swicg.github.io/miscellany/#sensitive)
        - Official stance:
          - No intent to write a CW FEP; [too many problems](https://github.com/swicg/activitypub-trust-and-safety/issues/1#issuecomment-2769502144) to move forwards.
          - Content Labels are far superior because they give the user easy control over what they want to see without relying on string or regex matching of free text, and can support third-party labellers, meaning responsibility for labelling doesn't exclusively fall on the author self-censoring their content.
    - Emelia has started writing the Content Labels FEP (FEP-4c96)
        - Not included: third-party application of Content Labels (Future FEP in broader "third-party moderation services" context)
    - Gentle reminder to re-consider Piefed ["community flairs"](https://join.piefed.social/2025/05/10/how-piefed-federates-flair-on-posts-and-comments/)
        - Out of meeting response: Flairs are [more taxonomical](https://join.piefed.social/wp-content/uploads/2025/05/flair_examples.webp) than for controlling what you see. i.e., they aren't really for a moderation purpose
        - Emelia is supportive of someone writing FEPs for "badges" and general taxonomical categorisation of content, however, this is not what content labels is for (Content Labels FEP will specifically include text to this extent)
    - Issues with labels learned from Bluesky:
        - No control over what a labeller can do (e.g., a labeller can hide stuff without your knowledge)
        - Usage of labels for "badges" and other decorative uses: that makes the "label" able to be "misused" by consumers (i.e., not within the Labelers original intent).
          - For example a labeller that verified that you're a resident in Sweden would consequentially not just provide a "badge" on the profile, but actually allow others to go into their labeler preferences and say "Hide all posts from swedish people" which is obviously an unintended side-effect of using labels for this decorative purpose.
        - More details: https://juliet.leaflet.pub/3m2kcvl2oys24 (tl;dr: with great power comes great responsibility and ability for abuse)
    - FediMod FIRES specifically uses `fires:Label` for its Label objects, specifically to support moving to the `ContentLabel` or `ModerationLabel` object in the future (or `Label` if we want to be generic), and that way we wouldn't clash on namespace.

## Action Items

- [ ] Emelia: upload NLNet grant application *somewhere* (Application itself contains my sensitive private information)
- [ ] Emelia: writing first pass at Content Labels FEP (4c96)
- [ ] Evan: review and finish for the report any T&S features in AS2 and AP core (carried over)
- [ ] Evan: submit feedback re: [implementor best practices](https://swicg.github.io/activitypub-trust-and-safety/initial-report/)

## Addendum

- Issue #1 has been closed as "not planned"
