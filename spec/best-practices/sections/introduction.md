## Introduction

> Trust and safety is the study of how people abuse the internet to cause real human harm, often using products the way they are designed to work. [^2]

T&S covers various practices and concerns related to making social platforms trustworthy and safe for their users as well as their operators. These concerns range from anti-harassment work to community building to ensuring legal compliance. They span the domains of policy, engineering, and operations teams. Policy teams define rules for allowed content and behavior. Operations enforce such rules through content moderation while engineering teams create software features that allow Operations to detect and respond to infractions[^1]. Through the collaboration between different teams and their professional domains, but also through the interactions between different software features, trust and safety can be worked towards. Different software features affect the possibility to moderate. Not only those associated with content moderation (tools to report, block, or otherwise attenuate content) but also those not typically associated, such as sign-up flows or different types of content listings. 

Avoiding different types of harm is the main focus of T&S work. Harms can result from actors exploiting vulnerabilities in a given design. However, as the opening quote highlights, they can also result from a design's intended use. Furthermore, different user groups experience different harms. A feature of great utility to one user can be a source of harm for another. Specific software features thus always entail trade-offs between beneficial uses and harmful ones. To a certain extent, these tradeoffs can be modeled and reasoned in advance. Often, however, harms and threats emerge in ways that are challenging to foresee by individual developers or operators. 

In a federated environment the challenges of T&S get an additional dimension because they involve the cooperation of different operators who can not necessarily trust one another nor share insights. Similarly, threats and abuses can spread across hosts or exploit specific interactions between different interoperable systems or their incompatibilities. 

For this reason, these pages discuss best practices in the design of features in multi-user applications relying on ActivityPub. We draw from and document specific trade-offs made by implementers in response to actual use and abuse patterns. We use the language of trade-offs to discuss advantages and disadvantages of specific approaches. Finally, we focus on the ways features work proactively or reactively.  


[^1]: https://www.tspa.org/curriculum/ts-fundamentals/content-moderation-and-operations/what-is-content-moderation/

[^2]: https://tsjournal.org/index.php/jots/article/view/8/51