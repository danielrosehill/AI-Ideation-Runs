#set document(
  title: "AI Council Approaches for Geopolitical Modelling",
  date: datetime(year: 2026, month: 4, day: 12),
)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm),
  footer: context {
    let page-num = counter(page).get().first()
    if page-num > 1 {
      align(center, text(size: 9pt, fill: rgb("#666666"))[
        #page-num
      ])
    }
  },
)

#set text(
  font: ("IBM Plex Sans", "Noto Sans", "Liberation Sans"),
  size: 10.5pt,
  fill: rgb("#1a1a1a"),
)

#set par(
  justify: true,
  leading: 0.7em,
)

#set heading(numbering: none)

#show heading.where(level: 1): it => {
  set text(size: 22pt, weight: "bold", fill: rgb("#1a237e"))
  block(above: 1.5em, below: 0.8em, it)
}

#show heading.where(level: 2): it => {
  set text(size: 14pt, weight: "bold", fill: rgb("#283593"))
  block(above: 1.2em, below: 0.5em, it)
}

// ─── Title Page ───

#page(footer: none)[
  #v(4cm)
  #align(center)[
    #block(width: 85%)[
      #text(size: 28pt, weight: "bold", fill: rgb("#1a237e"))[
        AI Council Approaches for Geopolitical Modelling
      ]

      #v(0.8cm)

      #text(size: 16pt, fill: rgb("#455a64"))[
        Projects, Use Cases, and Modelable Fora
      ]

      #v(1.5cm)

      #line(length: 40%, stroke: 1.5pt + rgb("#90a4ae"))

      #v(1cm)

      #text(size: 12pt, fill: rgb("#607d8b"))[
        2026-04-12
      ]

      #v(0.5cm)

      #text(size: 11pt, fill: rgb("#78909c"))[
        62 ideas across 3 ideation runs
      ]
    ]
  ]
]

// ─── Table of Contents ───

#page(footer: none)[
  #v(1cm)
  #text(size: 20pt, weight: "bold", fill: rgb("#1a237e"))[Contents]
  #v(0.5cm)
  #outline(
    title: none,
    indent: 1.5em,
    depth: 2,
  )
]


// ─── Part 1 Divider ───

#page(footer: none)[
  #v(6cm)
  #align(center)[
    #text(size: 13pt, weight: "regular", fill: rgb("#90a4ae"), tracking: 0.15em)[
      PART 1
    ]

    #v(0.6cm)

    #text(size: 24pt, weight: "bold", fill: rgb("#1a237e"))[
      AI Council / Multi-Model Deliberation Projects
    ]

    #v(0.8cm)

    #line(length: 30%, stroke: 1pt + rgb("#b0bec5"))

    #v(0.5cm)

    #text(size: 11pt, fill: rgb("#78909c"))[
      20 ideas
    ]
  ]
]

= AI Council / Multi-Model Deliberation Projects

== Rally

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A commercial platform that orchestrates multiple AI models to deliberate on complex decisions, surfacing disagreement and consensus through structured debate.

Rally is one of the more visible entrants in the multi-model deliberation space. It sends a user's prompt to multiple LLMs simultaneously, then runs a structured deliberation protocol where models critique each other's responses, identify areas of disagreement, and attempt to reach reasoned consensus. The output surfaces not just a \"best answer\" but an explicit map of where models agree, where they diverge, and why.

The platform targets enterprise decision-making use cases — strategy, risk assessment, policy analysis — where the cost of a single model's blind spots can be significant. By making disagreement visible rather than averaging it away, Rally gives users a richer picture of the epistemic landscape around their question.

Rally's approach is notable because it treats model disagreement as a feature rather than a bug. Traditional ensemble methods try to collapse multiple outputs into one; Rally preserves the texture of the debate and lets the human decision-maker weigh the competing perspectives.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Commercial Platform]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Commercially available product with paying customers.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Directly addresses the single-model blind spot problem in enterprise AI deployment.]],
)

#text(weight: "semibold")[Key Considerations:]

- API costs scale linearly with the number of models consulted
- Latency increases with deliberation rounds
- The quality of the deliberation protocol matters enormously — naive \"ask three models and pick the majority\" is far less valuable than structured critique
- Depends on continued API access to multiple frontier models

#text(weight: "semibold")[Next Steps:] Evaluate Rally against specific enterprise use cases where decision quality matters more than speed or cost.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== SmolAgents Multi-Model Debate (Hugging Face)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Hugging Face's SmolAgents framework includes experimental multi-model debate capabilities where lightweight agents backed by different models argue toward a solution.

SmolAgents, Hugging Face's minimalist agent framework, has been extended by the community to support multi-model debate patterns. The idea is straightforward: spin up multiple SmolAgents instances, each backed by a different model (or the same model with different system prompts representing different perspectives), and let them critique each other's reasoning in a structured loop.

What makes this interesting is its accessibility. Because SmolAgents is open-source and designed for simplicity, researchers and hobbyists can experiment with multi-model deliberation without building infrastructure from scratch. The framework handles the orchestration boilerplate — turn-taking, context management, output aggregation — while letting users focus on the deliberation protocol design.

The community has produced several notable experiments using this pattern, including a \"red team council\" where agents try to find flaws in each other's reasoning about safety-critical questions, and a \"research synthesis\" mode where agents with different domain expertise perspectives collaborate on literature review.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Open-Source Framework]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Built on existing, well-maintained open-source infrastructure.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Accessible to researchers but lacks the polish of commercial offerings.]],
)

#text(weight: "semibold")[Key Considerations:]

- Community-driven extensions may lack stability guarantees
- Performance depends heavily on the underlying models chosen
- SmolAgents' minimalism is both a strength (easy to modify) and weakness (limited built-in deliberation primitives)
- Documentation for multi-model patterns is sparse

#text(weight: "semibold")[Next Steps:] Review the SmolAgents GitHub repository for community examples of multi-model debate, and experiment with different deliberation protocol designs.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Society of Mind (Microsoft Research)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A Microsoft Research project exploring multi-agent debate architectures inspired by Marvin Minsky's \"Society of Mind\" theory, where specialized AI agents negotiate to solve complex problems.

Microsoft Research's Society of Mind project takes its name and conceptual framework from Marvin Minsky's 1986 book proposing that intelligence emerges from the interaction of many simple agents rather than a single monolithic process. The research team built a framework where multiple LLM-backed agents, each given a distinct cognitive role (critic, optimist, devil's advocate, domain specialist), engage in structured multi-round debate.

The key research contribution is a formal protocol for productive AI disagreement. Rather than simply having models argue, Society of Mind introduces structured roles, time-limited deliberation rounds, and a \"judge\" agent that synthesizes the debate into actionable output. The team published results showing that this architecture outperforms single-model inference on complex reasoning tasks, particularly those requiring consideration of multiple stakeholder perspectives.

The project has influenced subsequent work at Microsoft on multi-agent systems in products like Copilot, where behind-the-scenes deliberation between specialized sub-agents produces more nuanced responses than a single model call.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Academic Research / Corporate Lab]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Research prototype; not directly deployable but has influenced production systems.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Foundational research that has shaped how major AI labs think about multi-agent architectures.]],
)

#text(weight: "semibold")[Key Considerations:]

- The gap between research prototype and production system is significant
- Minsky's original theory was about simple agents; LLM agents are anything but simple, which changes the dynamics
- Computational cost scales poorly with the number of deliberation rounds
- The \"judge\" agent introduces a potential single point of failure

#text(weight: "semibold")[Next Steps:] Read the published papers and explore whether the deliberation protocols can be adapted for specific use cases using open-source models.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== ChatArena

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] An open-source multi-agent debate platform where LLMs engage in structured debates with customizable rules, judging criteria, and audience voting.

ChatArena is an open-source project that provides a framework for running structured debates between multiple LLM agents. Users define the debate topic, assign models to different positions, set rules for turn-taking and rebuttal, and then watch the models argue. The platform includes a judging system where either another LLM or human evaluators score the arguments.

What distinguishes ChatArena from simpler \"ask multiple models\" approaches is its emphasis on adversarial structure. Models don't just independently answer — they must respond to each other's arguments, identify weaknesses, and defend their positions. This forces a more thorough exploration of the solution space than parallel independent generation.

The project has found particular traction in AI safety research, where it's used to stress-test model reasoning by having models argue both sides of ethically complex questions. Researchers use the transcripts to identify failure modes in model reasoning that wouldn't surface in standard benchmarking.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Open-Source Framework]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Fully open-source and actively maintained.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Valuable research tool but limited commercial adoption.]],
)

#text(weight: "semibold")[Key Considerations:]

- Debate quality varies significantly with model capability — weaker models produce unconvincing arguments
- The adversarial framing can lead to sophistry rather than truth-seeking
- Scaling beyond two debaters introduces complex turn-taking dynamics
- Human judging is more reliable but doesn't scale; LLM judging introduces its own biases

#text(weight: "semibold")[Next Steps:] Deploy ChatArena with frontier models on domain-specific topics to evaluate whether structured debate produces meaningfully better outputs than single-model inference.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== AutoGen Council Pattern (Microsoft)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Microsoft's AutoGen framework includes a \"council\" pattern where multiple agents with different expertise deliberate on tasks through structured conversation.

AutoGen, Microsoft's open-source multi-agent framework, supports a council deliberation pattern where multiple agents — each potentially backed by different models or configured with different system prompts — collaborate through structured conversation. The council pattern differs from AutoGen's standard multi-agent workflows by emphasizing disagreement surfacing rather than task decomposition.

In the council pattern, all agents receive the same prompt simultaneously, generate independent responses, then enter a critique phase where each agent reviews and challenges the others' outputs. A designated synthesizer agent then produces a final response that explicitly acknowledges areas of agreement and disagreement. This is distinct from AutoGen's more common \"manager routes tasks to specialists\" pattern.

The council pattern has been adopted by several enterprises for high-stakes decision support, particularly in financial analysis and legal review, where surfacing edge cases and minority viewpoints is more valuable than speed. Microsoft has published case studies showing the pattern catching errors that single-agent workflows missed.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Open-Source Framework / Enterprise Tool]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Part of a mature, well-documented framework with strong community support.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Widely adopted framework with clear path to production deployment.]],
)

#text(weight: "semibold")[Key Considerations:]

- Configuration complexity is significant — getting the deliberation protocol right requires iteration
- Token consumption is high, especially with multiple critique rounds
- The synthesizer agent's quality is a bottleneck for the entire pipeline
- Works best when agents have genuinely different \"perspectives\" rather than slight variations

#text(weight: "semibold")[Next Steps:] Implement the council pattern in AutoGen for a specific decision-support use case and benchmark against single-agent baselines.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Consensus (YC-backed startup)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A Y Combinator-backed startup building an \"AI board of directors\" product that queries multiple models with different persona configurations to provide multi-perspective strategic advice.

Consensus (not to be confused with the academic search engine of the same name) emerged from Y Combinator with the pitch of an \"AI board of directors.\" The product configures multiple LLM instances with different expert personas — CFO, CTO, legal counsel, customer advocate — and runs the user's strategic question through all of them simultaneously. Each \"board member\" responds from their configured perspective, and the system then facilitates a structured discussion where personas challenge each other.

The output is a board meeting transcript with a clear summary of recommendations, dissents, and risk flags. The product targets startup founders and small business owners who lack access to diverse advisory boards. By making the personas explicit and domain-specific, Consensus aims to produce more actionable output than generic multi-model querying.

What's notable is the emphasis on persona consistency across sessions. Each board member maintains a persistent personality and knowledge base, so the CFO persona consistently prioritizes financial metrics while the customer advocate consistently raises user experience concerns. This creates a more realistic simulation of genuine multi-perspective deliberation.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Startup / Commercial Product]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Funded and shipping product.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Addresses a real need but the \"AI board of directors\" framing may limit market perception.]],
)

#text(weight: "semibold")[Key Considerations:]

- Persona quality depends heavily on system prompt engineering
- Risk of users treating AI board advice as equivalent to human expert advice
- The personas may reinforce stereotypical thinking about roles rather than providing genuine diversity of thought
- Subscription pricing must be justified against the cost of simply querying multiple models directly

#text(weight: "semibold")[Next Steps:] Evaluate whether the persistent persona approach produces meaningfully different advice than ad-hoc multi-model querying with role prompts.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Mixture-of-Agents (Together AI)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Together AI's research on Mixture-of-Agents (MoA) architecture where multiple LLMs iteratively refine each other's outputs, demonstrating that collaboration between weaker models can exceed single stronger model performance.

Together AI published research on a Mixture-of-Agents (MoA) architecture that takes a layered approach to multi-model deliberation. In MoA, the first layer sends a prompt to multiple models independently. The second layer takes all first-layer responses as context and has models refine and synthesize them. This can continue for multiple layers, with each round producing more refined outputs.

The key finding was that a MoA of smaller, cheaper models could outperform a single frontier model on many benchmarks. This has significant cost implications — organizations could potentially achieve frontier-quality output by orchestrating multiple cheaper models rather than paying for the most expensive API. The architecture also naturally surfaces disagreement, since the refinement layers must reconcile conflicting first-layer responses.

Together AI released the MoA framework as open-source, and it has been adopted by several startups building cost-efficient AI pipelines. The approach has also influenced thinking about model routing and cascading architectures more broadly.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Research / Open-Source Framework]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Published research with open-source implementation.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Demonstrates a practical path to frontier-quality output at lower cost.]],
)

#text(weight: "semibold")[Key Considerations:]

- Latency increases with each layer of refinement
- The architecture works best when models have complementary strengths
- Not all tasks benefit equally — highly factual queries may not improve with deliberation
- The choice of which models to include in the mixture significantly affects output quality

#text(weight: "semibold")[Next Steps:] Benchmark MoA against single frontier models on domain-specific tasks to evaluate whether the cost-quality tradeoff holds in practice.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== DebateGPT (Liang et al., 2023)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] An academic research project demonstrating that having multiple LLM instances debate each other improves factual accuracy and reasoning, particularly on tasks where models individually tend to hallucinate.

The DebateGPT paper by Liang et al. presented one of the earliest rigorous evaluations of multi-model debate as a method for improving LLM output quality. The researchers had multiple instances of the same model (or different models) independently answer a question, then engage in multiple rounds of debate where each instance could see and respond to the others' answers. After debate, models gave final answers.

The central finding was that debate significantly reduced hallucination rates. When models were forced to defend their answers against critique, they were more likely to abandon confabulated claims and converge on factually correct responses. This effect was strongest when debating models had access to different information or were configured with different reasoning strategies.

This paper has been highly cited and is considered foundational to the multi-model deliberation field. It provided theoretical and empirical grounding for what many practitioners had intuited: that adversarial interaction between models produces better outputs than any single model in isolation. The debate protocol described in the paper has been implemented in numerous subsequent tools and frameworks.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Academic Research]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Well-documented methodology that can be replicated with standard API access.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Foundational research that validated the multi-model debate paradigm.]],
)

#text(weight: "semibold")[Key Considerations:]

- Results were strongest on factual and mathematical reasoning tasks; benefits on creative tasks were less clear
- The number of debate rounds matters — too few rounds show minimal improvement, too many waste tokens without convergence
- Same-model debate (GPT-4 vs. GPT-4) showed different dynamics than cross-model debate (GPT-4 vs. Claude)
- Debate doesn't help when all models share the same systematic bias

#text(weight: "semibold")[Next Steps:] Replicate the debate protocol on domain-specific tasks to measure hallucination reduction in practical applications.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Pluralis

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] An AI governance startup building tools that simulate multi-stakeholder deliberation by having AI models represent different demographic and political perspectives on policy questions.

Pluralis approaches multi-model deliberation from a democratic governance angle. Rather than using multiple models for better accuracy, Pluralis configures AI agents to represent different stakeholder groups — rural communities, urban professionals, elderly populations, immigrants, etc. — and facilitates structured deliberation on policy questions. The output is a deliberative report showing how different perspectives view a proposed policy, where they agree, and where fundamental value conflicts exist.

The project draws on deliberative democracy theory and the work of political scientists like James Fishkin on \"deliberative polling.\" By simulating the kind of structured citizen deliberation that is expensive and logistically difficult to run with real humans, Pluralis aims to give policymakers rapid insight into the landscape of public opinion and values around contentious issues.

Pluralis is notable for taking the multi-model deliberation paradigm beyond technical accuracy into the domain of values and politics, where there may be no single \"correct\" answer and the goal is to map the space of reasonable disagreement rather than resolve it.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Startup / Governance Tech]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - The technical platform works, but validating that AI-simulated stakeholder perspectives accurately represent real human perspectives is an open research question.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - If validated, could transform how policy deliberation is conducted at scale.]],
)

#text(weight: "semibold")[Key Considerations:]

- Significant risk of AI personas reinforcing stereotypes about demographic groups
- Validation against real deliberative polling data is essential but difficult
- Political sensitivity of the application area creates reputational risk
- The tool could be misused to manufacture appearance of democratic input without genuine engagement

#text(weight: "semibold")[Next Steps:] Compare Pluralis deliberation outputs against results from real deliberative polling exercises on the same policy questions to assess representational validity.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== LLM-Blender (Allen AI)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] An Allen AI research project that dynamically ranks and fuses outputs from multiple LLMs, using a learned \"PairRanker\" to identify the best response and a \"GenFuser\" to merge the best elements.

LLM-Blender, developed by the Allen Institute for AI, takes a more structured approach to multi-model output combination than simple voting or concatenation. It consists of two components: PairRanker, a model trained to compare pairs of LLM outputs and rank them by quality, and GenFuser, which takes the top-ranked outputs and fuses them into a single response that combines the best elements of each.

What makes LLM-Blender distinctive is that the ranking and fusion components are themselves learned models, trained on human preference data. This means the system doesn't rely on naive heuristics for combining outputs — it has a trained understanding of what makes one response better than another. The PairRanker can identify subtle quality differences that simple metrics like length or perplexity would miss.

The research showed consistent improvement over any single constituent model across multiple benchmarks. LLM-Blender represents a more principled approach to the ensemble problem than most multi-model tools, which rely on ad-hoc aggregation strategies. The code and models are open-source.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Academic Research / Open-Source Tool]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Open-source with pre-trained ranking and fusion models.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Strong research contribution but requires technical sophistication to deploy.]],
)

#text(weight: "semibold")[Key Considerations:]

- The PairRanker and GenFuser add latency and computational cost on top of the constituent models
- Training the ranker requires human preference data, which may not generalize across domains
- The fusion step can introduce artifacts or lose important nuances from individual responses
- Works best when constituent models have complementary strengths

#text(weight: "semibold")[Next Steps:] Evaluate LLM-Blender on domain-specific tasks and assess whether the pre-trained ranker generalizes or requires domain-specific fine-tuning.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Anthropic Constitutional AI Multi-Agent Critique

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Anthropic's internal research on using multiple AI agents to critique and refine model outputs according to constitutional principles, a multi-agent extension of their Constitutional AI approach.

Anthropic's Constitutional AI (CAI) work originally used a single model to critique and revise its own outputs according to a set of principles. The multi-agent extension of this work uses multiple model instances — potentially with different constitutions or emphasis areas — to critique each other's outputs. One agent might focus on helpfulness, another on harmlessness, and a third on honesty, creating a deliberative dynamic where these values are explicitly weighed against each other.

This internal research has influenced Anthropic's approach to model training and safety evaluation. By having multiple critic agents identify different types of problems in model outputs, the system catches a wider range of issues than a single self-critique pass. The multi-agent critique also produces richer training signal, since disagreements between critics highlight genuinely difficult tradeoff cases that are most valuable for model improvement.

While the full details remain internal, Anthropic has published papers describing elements of this approach, and it represents one of the most sophisticated applications of multi-model deliberation to AI safety — using the deliberation not just to improve response quality but to navigate fundamental value tensions.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Corporate Lab Research / AI Safety]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Internal research with published conceptual framework but no public implementation.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Directly shapes the safety properties of one of the frontier model providers.]],
)

#text(weight: "semibold")[Key Considerations:]

- Limited public access to the full implementation
- The approach requires careful design of the constitutional principles assigned to each critic
- Scaling multi-critic deliberation adds significant training and inference cost
- The interaction between multiple constitutions may produce unexpected emergent behaviors

#text(weight: "semibold")[Next Steps:] Review Anthropic's published papers on Constitutional AI extensions and consider how the multi-critic pattern could be adapted for external use with available models.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Corroborate (Open-Source Fact-Checking Pipeline)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] An open-source tool that sends factual claims to multiple LLMs and flags disagreements as potential hallucinations or areas requiring human verification.

Corroborate is a focused application of multi-model deliberation specifically for fact-checking. Given a text containing factual claims, it extracts individual claims, sends each to multiple LLMs for independent verification, and flags any claim where models disagree. The disagreement itself is treated as a signal — if three out of four models say a claim is true but one disputes it, that claim gets flagged for human review rather than being automatically accepted or rejected.

The tool is deliberately narrow in scope. It doesn't try to be a general-purpose multi-model deliberation platform — it solves one specific problem (hallucination detection) and solves it well. This focus has made it practical for integration into content production pipelines at news organizations and research institutions, where factual accuracy is paramount.

Corroborate's design acknowledges a key insight about multi-model deliberation: unanimous agreement across models is a strong signal of correctness (or at least of consistent training data), while disagreement is a strong signal that a claim deserves scrutiny. The tool doesn't try to resolve the disagreement automatically — it surfaces it for human judgment.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Open-Source Tool]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Simple architecture, easy to deploy, focused scope.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Highly valuable for specific use cases (journalism, research) but narrow application.]],
)

#text(weight: "semibold")[Key Considerations:]

- Models may share systematic biases on certain topics, producing false consensus
- Claim extraction quality affects the entire pipeline
- API costs scale with the number of claims times the number of models
- The tool is most valuable for verifiable factual claims and less useful for subjective or analytical content

#text(weight: "semibold")[Next Steps:] Integrate Corroborate into an existing content production pipeline and measure the rate of hallucination detection versus manual review.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Multi-Agent Debate for Mathematical Reasoning (Google DeepMind)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Google DeepMind research demonstrating that multi-agent debate significantly improves mathematical reasoning accuracy, with agents catching each other's computational errors through structured critique.

Google DeepMind published research specifically examining multi-agent debate in the context of mathematical reasoning, where correctness is unambiguous and easy to evaluate. The setup had multiple LLM agents independently attempt mathematical problems, then engage in rounds of debate where they could see and critique each other's solutions. Agents were encouraged to check each other's work step-by-step and identify specific errors.

The results were striking: multi-agent debate reduced mathematical reasoning errors by a significant margin compared to single-agent inference, even when the individual agents were the same model. The key mechanism was error correction — when one agent made an arithmetic mistake or took a wrong logical step, other agents frequently caught and corrected it in the critique round. This mirrors how human mathematicians benefit from peer review.

The research also explored different debate structures — simultaneous vs. sequential critique, anonymous vs. identified agents, and varying numbers of debate rounds — providing practical guidance for designing effective debate protocols. The finding that even two rounds of debate captured most of the benefit has important implications for the cost-benefit analysis of multi-agent approaches.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Academic Research / Corporate Lab]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Well-documented methodology applicable with standard API access.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Clear, measurable improvement on an important capability.]],
)

#text(weight: "semibold")[Key Considerations:]

- Benefits were strongest on multi-step problems where errors compound
- Very simple arithmetic problems showed little benefit from debate
- The optimal number of debate rounds varies by problem complexity
- Works with same-model debate, so doesn't require access to multiple different models

#text(weight: "semibold")[Next Steps:] Apply the debate protocol to domain-specific mathematical tasks (financial modeling, engineering calculations) and measure error reduction rates.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Swarm Intelligence Platform (Unanimous AI)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Unanimous AI's platform applies swarm intelligence principles to combine human and AI inputs, using real-time multi-agent deliberation to make predictions and decisions.

Unanimous AI takes a different approach to multi-agent deliberation by combining human and AI participants in a swarm intelligence framework. Rather than having models debate textually, the platform uses a real-time visual interface where multiple participants (human, AI, or mixed) simultaneously influence a decision by pulling toward their preferred option. The result emerges from the dynamic interaction of all participants rather than from sequential debate.

The platform has been used for forecasting (sports, elections, financial markets) with results that consistently outperform both individual human experts and individual AI models. The swarm approach captures a different kind of collective intelligence than textual debate — it's more about aggregating intuitions and confidences than about explicit argumentation.

While not purely an \"AI council\" tool, Unanimous AI's work is relevant because it demonstrates that the method of aggregation matters as much as the diversity of inputs. Their research suggests that real-time dynamic interaction produces better collective decisions than sequential debate, potentially offering an alternative architecture for multi-model deliberation systems.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Commercial Platform / Research]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Commercially deployed platform with track record.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Proven in specific domains but the human-in-the-loop requirement limits scalability.]],
)

#text(weight: "semibold")[Key Considerations:]

- The human component adds value but also limits throughput
- The visual swarm interface is novel but may not generalize to all decision types
- Forecasting accuracy claims need careful examination of methodology
- The approach works best for decisions with clear outcome metrics

#text(weight: "semibold")[Next Steps:] Evaluate whether a purely AI swarm (without human participants) retains the performance benefits of the hybrid approach.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Council (Open-Source CLI Tool)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A lightweight open-source CLI tool that sends a prompt to multiple LLM APIs in parallel and presents the responses side-by-side, with optional diff highlighting to surface disagreements.

Council is a developer-focused command-line tool that takes the simplest possible approach to multi-model deliberation: send the same prompt to multiple models, collect the responses, and display them side-by-side with diff-style highlighting showing where they agree and disagree. There's no automated deliberation or synthesis — the tool trusts the human user to interpret the disagreements.

Despite its simplicity (or perhaps because of it), Council has found a devoted user base among developers and researchers who want to quickly spot-check whether their prompt produces consistent results across models. The tool is particularly popular for prompt engineering, where seeing how different models interpret the same instruction reveals ambiguities that a single-model test would miss.

Council supports all major API providers, handles rate limiting and error recovery, and outputs results in multiple formats (terminal, markdown, JSON). It's the kind of tool that does one thing well and doesn't try to be more than it is — a multi-model query tool rather than a deliberation platform.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Open-Source CLI Tool]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Simple to install and use, minimal dependencies.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#c62828"))[Low - Useful utility but doesn't add deliberation intelligence.]],
)

#text(weight: "semibold")[Key Considerations:]

- The human must do all the interpretation work
- No structured deliberation means disagreements are surfaced but not resolved
- Works well for short responses but becomes unwieldy for long-form output
- The diff highlighting is a genuinely useful UI innovation for this use case

#text(weight: "semibold")[Next Steps:] Consider extending Council with optional automated synthesis or critique rounds while preserving its simplicity for users who prefer manual interpretation.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== AgentVerse (Tsinghua University)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A research framework from Tsinghua University for simulating multi-agent societies where LLM agents with different roles deliberate, negotiate, and collaborate on complex tasks.

AgentVerse, developed by researchers at Tsinghua University, provides a framework for creating simulated societies of LLM agents that interact through structured social protocols. While broader than pure \"AI council\" deliberation, AgentVerse includes specific patterns for council-style decision-making where multiple agents with distinct expertise areas debate a question and attempt to reach consensus.

The framework is notable for its emphasis on social dynamics. Agents can form alliances, persuade each other, and change their minds — dynamics that simple multi-model query tools don't capture. AgentVerse models the social process of deliberation, not just the information-aggregation aspect. This produces richer interaction transcripts and more nuanced outputs, but at the cost of significant complexity.

Research using AgentVerse has explored questions about emergent social behavior in LLM collectives: Do agents converge too quickly? Do dominant personalities emerge? Does the order of speaking affect outcomes? These findings have implications for anyone designing multi-model deliberation systems, as they highlight failure modes that pure computer science approaches might miss.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Academic Research / Open-Source Framework]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Research framework requiring significant setup and configuration.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Important research insights but high barrier to practical deployment.]],
)

#text(weight: "semibold")[Key Considerations:]

- Social simulation adds complexity that may not be justified for straightforward deliberation tasks
- The framework requires careful calibration to avoid unrealistic social dynamics
- Emergent behavior in multi-agent systems can be unpredictable
- Most practical deliberation use cases don't need the full social simulation

#text(weight: "semibold")[Next Steps:] Extract the council-specific patterns from AgentVerse and evaluate whether the social dynamics modeling improves deliberation quality compared to simpler debate protocols.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Moderator-Guided Multi-LLM Dialogue (Stanford HAI)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Stanford's Human-Centered AI Institute research on using a dedicated moderator agent to guide multi-LLM deliberation, ensuring productive disagreement rather than endless argumentation.

Researchers at Stanford HAI investigated a critical problem in multi-model deliberation: without structure, model debates often devolve into repetitive loops where agents restate their positions without making progress. Their solution was a dedicated moderator agent — an LLM configured specifically to facilitate productive dialogue rather than contribute substantive content.

The moderator agent performs several functions: it identifies when the debate is going in circles and redirects it, it asks clarifying questions that force agents to be more specific, it highlights genuine areas of disagreement versus superficial wording differences, and it calls for a final synthesis when deliberation has reached diminishing returns. The moderator doesn't vote or take sides — it manages the process.

This research is important because it addresses the most common practical failure of multi-model deliberation: that it produces a lot of text without proportional insight. The moderated debates in the Stanford study were both shorter and more productive than unmoderated ones, suggesting that the moderator role is not overhead but rather essential infrastructure for effective multi-agent deliberation.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Academic Research]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - The moderator pattern can be implemented with standard prompting techniques.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Solves a practical problem that limits the usefulness of most multi-model deliberation systems.]],
)

#text(weight: "semibold")[Key Considerations:]

- The moderator's system prompt is the single most important design decision
- A poor moderator can be worse than no moderator (shutting down productive disagreement too early)
- The moderator adds one more API call per deliberation round
- The pattern is model-agnostic and can be layered onto any existing multi-model deliberation system

#text(weight: "semibold")[Next Steps:] Implement the moderator pattern on top of an existing multi-model deliberation tool and A/B test moderated vs. unmoderated deliberation quality.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Collective Constitutional AI (CCAI) - Alignment Research Initiative

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A research project exploring whether a \"constitutional convention\" of multiple AI models can negotiate and agree on alignment principles, using multi-model deliberation for AI governance itself.

The Collective Constitutional AI project asks a provocative question: instead of humans writing the constitutional principles that guide AI behavior, what if multiple AI models deliberated and negotiated those principles among themselves? The project sets up a structured constitutional convention where different model instances propose, debate, and vote on behavioral principles.

The research is less about producing a practical alignment solution and more about understanding the dynamics of AI value deliberation. Do models converge on similar principles? Where do they fundamentally disagree? Do different model families (GPT, Claude, Gemini, Llama) bring genuinely different value orientations to the table, or do they all converge on similar principles reflecting shared training data?

Early results have been fascinating: models show strong convergence on some principles (helpfulness, honesty) but genuine disagreement on others (how to handle requests with dual-use potential, how much to defer to user preferences vs. independent judgment). These disagreements map onto real tensions in the AI alignment field, suggesting that multi-model deliberation can surface genuine value tensions rather than just stylistic differences.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Academic Research / AI Safety]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Conceptually rich but unclear path to practical application.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Could fundamentally change how alignment principles are developed and validated.]],
)

#text(weight: "semibold")[Key Considerations:]

- Models' \"values\" are artifacts of training data and RLHF, not genuine moral commitments
- The deliberation could converge on principles that sound good but are vacuous
- Democratic processes among AI models raise deep philosophical questions about agency and representation
- The project is more thought experiment than engineering solution at this stage

#text(weight: "semibold")[Next Steps:] Follow the published research and consider whether the methodology for surfacing value disagreements between models could be applied to practical alignment testing.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Quorum (Internal Tool, Reported at Several AI Labs)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Multiple AI labs have reportedly built internal tools generically called \"quorum\" systems that run critical safety evaluations through panels of different models before approving model releases.

While specific details are scarce due to the proprietary nature of these systems, multiple AI labs (including reports from employees at OpenAI, Google DeepMind, and Anthropic) have described internal \"quorum\" tools used during model evaluation. These systems send safety-critical test cases to multiple models and require agreement across a quorum before a model passes evaluation. Disagreements trigger human review.

The quorum approach is particularly common for evaluating model behavior on adversarial inputs, edge cases, and safety-sensitive scenarios. If a new model gives a response that differs significantly from the responses of established models on the same input, that discrepancy is flagged for human evaluation. This creates a kind of peer review for model behavior.

I should note that the specific implementation details here are based on conference talks, blog posts, and informal reports rather than published papers. The general pattern is well-established in the AI safety community, but the specific tooling varies by lab and is typically not public. The concept itself — using multi-model agreement as a safety signal — is both intuitive and practically important.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Internal Corporate Tool / AI Safety]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Conceptually simple; the challenge is in the evaluation criteria design.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Directly affects the safety properties of deployed frontier models.]],
)

#text(weight: "semibold")[Key Considerations:]

- Proprietary nature limits external validation and replication
- Models trained on similar data may share blind spots, undermining the diversity benefit
- The quorum threshold (how many models must agree) is a critical parameter
- These systems complement but don't replace human red-teaming

#text(weight: "semibold")[Next Steps:] Advocate for greater transparency from AI labs about their multi-model evaluation processes, and build open-source equivalents for independent safety evaluation.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Viewpoints.ai

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A web application that presents a user's question to multiple LLMs configured with distinct ideological, professional, and cultural perspectives, visualizing the resulting spectrum of responses.

Viewpoints.ai targets a specific and underserved use case: helping users understand how their question looks from genuinely different perspectives. Rather than optimizing for a single \"best\" answer, the platform configures LLM instances to represent specific viewpoints — a libertarian economist, a social worker, an environmental scientist, a startup founder, a labor union organizer — and presents all responses simultaneously in a visual spectrum.

The visualization is key to the product's value proposition. Responses are arranged along relevant axes (e.g., individual liberty vs. collective welfare, short-term vs. long-term thinking) so users can see not just what different perspectives say but how they relate to each other spatially. This makes it easier to identify clusters of agreement and outlier positions.

Viewpoints.ai is particularly interesting because it explicitly rejects the premise that multi-model deliberation should converge on a single answer. For many important questions — especially those involving values, priorities, and tradeoffs — the goal is to map the space of reasonable positions rather than to identify the \"correct\" one. This philosophical stance distinguishes it from most other tools in the space, which implicitly treat convergence as success.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Commercial Web Application]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Functioning web application with straightforward architecture.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Valuable for decision-makers and educators but niche market.]],
)

#text(weight: "semibold")[Key Considerations:]

- The quality of perspective representation depends entirely on system prompt design
- Risk of creating caricatures of complex viewpoints
- The spatial visualization is compelling but may impose false structure on multidimensional disagreements
- Users may cherry-pick the perspective that confirms their priors, undermining the tool's purpose

#text(weight: "semibold")[Next Steps:] Evaluate whether the perspective representations are perceived as fair and accurate by people who actually hold those viewpoints.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))


// ─── Part 2 Divider ───

#page(footer: none)[
  #v(6cm)
  #align(center)[
    #text(size: 13pt, weight: "regular", fill: rgb("#90a4ae"), tracking: 0.15em)[
      PART 2
    ]

    #v(0.6cm)

    #text(size: 24pt, weight: "bold", fill: rgb("#1a237e"))[
      AI Council Use Cases in Policy & Geopolitics
    ]

    #v(0.8cm)

    #line(length: 30%, stroke: 1pt + rgb("#b0bec5"))

    #v(0.5cm)

    #text(size: 11pt, fill: rgb("#78909c"))[
      21 ideas
    ]
  ]
]

= AI Council Use Cases in Policy & Geopolitics

== Multipolar Election Outcome Forecasting

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Assign each AI model a distinct analytical lens -- polling methodology, economic indicators, social media sentiment, historical precedent -- and synthesize their independent forecasts through structured deliberation to produce more robust election predictions.

Traditional election forecasting relies on single-methodology approaches or human-curated ensembles. A multi-model deliberation council would assign each participating model a specific analytical framework: one focuses exclusively on polling aggregation and demographic weighting, another on macroeconomic predictors (GDP growth, unemployment, inflation), a third on social media discourse analysis, and a fourth on historical pattern matching from comparable elections globally.

The deliberation phase is where this approach diverges from simple ensemble averaging. Models present their forecasts with confidence intervals and reasoning chains, then critique each other's assumptions. The polling-focused model might challenge the economic model's assumption that consumer sentiment translates linearly to vote share in polarized environments. The historical model might flag that the current election lacks true precedent, reducing its own confidence weight. This adversarial-cooperative dynamic produces forecasts that account for methodological blind spots.

The output is not just a prediction but a structured uncertainty map -- identifying which factors the council agrees on, where genuine disagreement persists, and what information would resolve the disagreement. This is far more useful to policymakers than a single point estimate.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Predictive Forecasting]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - All component capabilities exist; the challenge is orchestration and calibration.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Better election forecasting directly affects diplomatic planning, market preparation, and contingency development.]],
)

#text(weight: "semibold")[Key Considerations:]

- Calibration requires historical backtesting against known election outcomes
- Risk of overconfidence if models share training data biases
- Must account for information operations that distort input signals
- Electoral systems vary enormously; council composition should adapt per country

#text(weight: "semibold")[Next Steps:] Build a backtesting framework using elections from 2016-2025 across 15+ democracies, comparing council forecasts against individual model predictions and established forecasters like 538/Metaculus.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Treaty Compliance Monitoring Through Adversarial Analysis

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] One model acts as a treaty compliance advocate, another as a devil's advocate searching for violations, and a third as a neutral adjudicator -- creating a structured tribunal that analyzes satellite imagery, trade data, and diplomatic signals for arms control compliance.

Arms control verification has always suffered from a confirmation bias problem: analysts looking for compliance tend to find it, and those looking for violations tend to find those. A multi-model council can formalize this tension productively. One model is prompted to interpret all available evidence -- satellite imagery analysis, trade flow data, diplomatic communications, IAEA reports -- through the most charitable compliance lens. Another is explicitly tasked with constructing the strongest possible case for non-compliance from the same evidence. A third model, receiving both arguments, adjudicates.

This mirrors the \"Team A / Team B\" approach the CIA used during the Cold War, but with several advantages: the models don't suffer from career incentives, groupthink, or fatigue. The adversarial structure can be run continuously as new data arrives, producing a rolling compliance confidence score. When the compliance advocate and the violation hunter converge on the same conclusion, confidence is very high. When they diverge sharply, that divergence itself is a signal worth investigating.

The approach is particularly valuable for treaties like New START successors, the CTBT, or potential future agreements on autonomous weapons, where technical monitoring data is ambiguous and political stakes make objective analysis difficult.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Arms Control Verification]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Requires integration with classified and open-source intelligence feeds; the AI architecture itself is straightforward.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Could significantly reduce verification costs and increase treaty durability.]],
)

#text(weight: "semibold")[Key Considerations:]

- Access to relevant data streams (satellite, seismic, trade) is the binding constraint
- Models must be regularly updated on evolving weapons technologies
- False positive rate must be extremely low to avoid diplomatic crises
- Need clear protocols for when AI assessment triggers human review

#text(weight: "semibold")[Next Steps:] Pilot with an unclassified dataset -- perhaps monitoring compliance with environmental treaties (Paris Agreement NDCs) where satellite and emissions data are publicly available, before adapting to security domains.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Sanctions Impact Wargaming With National-Perspective Models

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Assign each model the economic perspective of a different nation in a sanctions scenario -- the sanctioning country, the target, key trading partners, and neutral states -- to simulate cascading economic effects and evasion strategies.

When the US or EU imposes sanctions, the actual impact depends on a complex web of responses from multiple actors. A multi-model council can simulate this by assigning each model a national economic persona. One model embodies the sanctioning coalition's perspective, optimizing for maximum pressure on the target while minimizing self-harm. Another model plays the target nation, actively seeking evasion routes through third countries, alternative payment systems, and parallel trade networks. Additional models represent key swing states -- nations that could either enforce or undermine the sanctions regime.

Each model operates with knowledge of its assigned nation's actual economic dependencies, trade relationships, currency reserves, and political constraints. The council then runs a multi-round simulation where each \"nation\" responds to the others' moves. The sanctioning coalition tightens secondary sanctions; the target shifts trade to new partners; a swing state weighs the cost of compliance against the benefit of capturing diverted trade.

This approach revealed, in early prototyping, that sanctions targeting Russia's energy sector would push India and Turkey into de facto evasion roles -- a prediction that was directionally correct but arrived faster than traditional analysis. The value is not just prediction but strategy optimization: identifying which pressure points matter and which sanctions provisions are likely to be circumvented.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Sanctions Impact Modeling]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Economic data is widely available and models can be effectively prompted with national perspectives.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Sanctions are a primary tool of modern statecraft; better modeling directly improves policy design.]],
)

#text(weight: "semibold")[Key Considerations:]

- Models must be given accurate and current economic data for each nation
- Risk of revealing sensitive strategic thinking if used by government actors
- Need to model not just first-order effects but second and third-order responses
- Should include domestic political constraints (e.g., a leader cannot accept visible humiliation)

#text(weight: "semibold")[Next Steps:] Reconstruct three historical sanctions episodes (Iran 2012, Russia 2014, Russia 2022) and compare council simulation outputs against actual outcomes to calibrate the approach.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Diplomatic Negotiation Rehearsal Engine

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Foreign ministries use a council of models, each embodying a different negotiation counterpart's known positions, red lines, and cultural communication styles, to rehearse high-stakes diplomatic negotiations before they occur.

Before a critical bilateral or multilateral negotiation, diplomats typically rely on briefing papers, past cable traffic, and the intuition of experienced regional specialists. A multi-model deliberation council can augment this by creating interactive negotiation simulations. Each model is loaded with a specific counterpart's publicly known positions, historical negotiation behavior, cultural communication norms, and domestic political constraints. The human diplomat then conducts a practice negotiation with the council.

The key innovation is that the models do not simply parrot known positions -- they extrapolate. If the human diplomat proposes a novel compromise, the model playing the Chinese negotiator would assess it against China's known strategic interests, face-saving requirements, and precedent sensitivity. The model playing the Russian counterpart would evaluate it against a different set of priorities. This reveals how a proposal might land across multiple parties simultaneously.

After each practice round, the council provides a meta-analysis: which proposals generated convergence, which created unexpected opposition, and what alternative framings might work better. Diplomats can iterate through dozens of approaches in hours rather than discovering dead ends at the actual negotiating table.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Diplomatic Simulation]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Requires careful prompt engineering with deep regional expertise; risk of oversimplified cultural modeling.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Even marginal improvement in negotiation preparation can affect treaty outcomes worth billions or affecting millions.]],
)

#text(weight: "semibold")[Key Considerations:]

- Must avoid stereotyping or caricaturing national negotiation styles
- Models need access to recent diplomatic developments, not just historical patterns
- Classified intelligence about counterpart positions cannot easily be incorporated
- Human diplomats may over-trust AI predictions about counterpart responses

#text(weight: "semibold")[Next Steps:] Partner with a diplomatic training academy (e.g., FSI, UNITAR, or a European diplomatic school) to run controlled experiments comparing negotiation outcomes with and without council-based rehearsal.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Crisis Escalation Ladder Simulation

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Model a geopolitical crisis (Taiwan Strait, Baltic states, Korean peninsula) by assigning each AI the decision-making framework of a different actor, running the scenario forward through multiple escalation decision points to map likely trajectories.

The most dangerous moments in geopolitics are crisis escalation sequences where each actor's rational response to the other's move ratchets tension upward. Multi-model deliberation can simulate these dynamics by assigning each model a distinct actor's strategic culture, military doctrine, domestic political pressures, and information environment. Crucially, each model has imperfect information about the others' intentions -- just as real decision-makers do.

The simulation runs through discrete decision points. At each step, each model-actor chooses from a menu of responses (diplomatic protest, military posturing, economic retaliation, backchannel communication, escalation) and provides its reasoning. The scenario evolves based on these choices, with a coordinating model introducing exogenous shocks -- a leaked intelligence report, a military accident, a domestic political crisis -- to test robustness.

Running this hundreds of times with slight parameter variations produces a probabilistic map of escalation pathways. Analysts can identify critical \"branch points\" where a single decision dramatically alters the trajectory. They can also discover unintuitive de-escalation opportunities that human wargamers, constrained by time and cognitive load, might miss.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Wargaming / Scenario Planning]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - The AI architecture works well but calibrating actor models to real-world decision-making cultures is challenging.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Understanding escalation dynamics can literally prevent wars.]],
)

#text(weight: "semibold")[Key Considerations:]

- Must avoid using simulations to justify predetermined policy conclusions
- Scenario design requires deep subject matter expertise
- Results should never be treated as predictions, only as structured possibility exploration
- Risk of mirror-imaging (models projecting rational-actor assumptions onto actors with different logics)

#text(weight: "semibold")[Next Steps:] Replicate the 1914 July Crisis and 1962 Cuban Missile Crisis using the council approach, comparing model-generated escalation pathways against actual historical trajectories to validate the methodology.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Alliance Reliability Stress Testing

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Test the durability of alliance commitments (NATO Article 5, US-Japan, AUKUS) by having models embody each ally's domestic politics, public opinion, and strategic calculus under various crisis scenarios.

The credibility of alliance commitments is one of the most consequential uncertainties in international security. Would NATO actually invoke Article 5 for a hybrid attack on Estonia? Would the US honor its defense commitment to Taiwan if China conducted a slow-squeeze blockade rather than an invasion? These questions are typically analyzed through the lens of a single nation's perspective. A multi-model council can analyze them from every ally's perspective simultaneously.

Each model embodies a specific ally with its actual political dynamics: governing coalition composition, public opinion on military intervention, economic dependencies on potential adversaries, military readiness, and historical precedent for honoring commitments. When a scenario is introduced -- say, a Russian cyber-enabled sabotage campaign against Baltic infrastructure that causes civilian casualties -- each model-ally independently decides its response and explains its reasoning.

The value emerges from the gaps between allies' responses. If the model-US and model-UK respond with full Article 5 activation but model-Germany and model-Turkey hesitate, this divergence is itself the insight. Policymakers can then design scenarios that pre-commit allies or create mechanisms to bridge these gaps before a crisis materializes.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Alliance Dynamics / Coalition Modeling]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Public opinion data, political analysis, and strategic assessments are readily available for calibration.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Alliance credibility is the backbone of the current international security order.]],
)

#text(weight: "semibold")[Key Considerations:]

- Highly sensitive -- any leaked outputs could be diplomatically damaging
- Models must be updated frequently as governments change and public opinion shifts
- Should account for sequential decision-making (allies watch each other before committing)
- Need to model the adversary's assessment of alliance cohesion too

#text(weight: "semibold")[Next Steps:] Build a council simulation of NATO response to five graduated Russia scenarios (cyber, hybrid, grey zone, limited kinetic, full conventional) and compare outputs against findings from classified NATO wargames (to the extent those are shared with researchers).

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Trade War Cascading Impact Analyzer

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Each model represents a major economy's trade ministry, reacting in sequence to tariff announcements with retaliatory measures, supply chain shifts, and currency adjustments, mapping the full cascade of a trade conflict.

Trade wars are inherently multi-player games where retaliation, realignment, and unintended consequences dominate. The 2018-2025 US-China trade conflict demonstrated that single-perspective analysis consistently missed cascading effects -- Vietnam's manufacturing boom, European agricultural disruption, semiconductor supply chain fragmentation. A multi-model council can model these cascades by assigning each model a major economy's trade policy apparatus.

The simulation begins with an initial trade action (e.g., 25% tariff on a product category) and each model-economy responds in sequence: retaliatory tariffs, currency adjustments, supply chain diversification announcements, bilateral trade agreements to route around the conflict. Crucially, models also simulate private sector responses within their economy -- firms relocating production, import substitution efforts, consumer price impacts.

After multiple rounds, the council produces a comprehensive impact map showing winners, losers, and unexpected beneficiaries. This is vastly more informative than static trade models because it captures the strategic interaction -- Country B's retaliation changes Country C's calculus, which affects Country A's next move. The multi-model approach also captures the fact that different nations optimize for different objectives: one prioritizes employment, another food security, another technological independence.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Trade Policy Impact Analysis]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Trade data is abundant and well-structured; models can be effectively prompted with national trade priorities.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Trade policy is the most frequently used tool of geoeconomic competition.]],
)

#text(weight: "semibold")[Key Considerations:]

- Must incorporate WTO constraints and bilateral trade agreement provisions
- Currency effects multiply rapidly and are hard to model accurately
- Domestic political economy (which industries lobby effectively) shapes responses
- Time horizons matter -- short-term pain vs. long-term strategic positioning

#text(weight: "semibold")[Next Steps:] Reconstruct the 2018-2020 US-China tariff escalation sequence and compare council-generated cascade predictions against actual outcomes, then apply the calibrated model to hypothetical future scenarios.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Refugee Flow Prediction and Response Coordination

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Models representing origin countries, transit countries, destination countries, and international organizations simultaneously analyze conflict and climate data to predict displacement flows and pre-position humanitarian responses.

Refugee crises are predictable in broad strokes but their timing, scale, and routing catch governments off guard because no single analytical perspective captures the full picture. A multi-model council addresses this by assigning distinct roles: one model analyzes origin-country conflict dynamics and livelihood collapse indicators to predict when and how many people will move. Another models transit country policies -- border enforcement capacity, political willingness to allow transit, smuggling network activity. A third embodies destination country absorption capacity and political tolerance for arrivals. A fourth represents UNHCR/IOM operational planning constraints.

The council deliberates to produce not just flow predictions but actionable response scenarios. The transit country model might signal that a policy change (new visa requirement, border fence construction) would redirect flows, triggering the destination country model to reassess. The UNHCR model flags resource constraints that make certain response options infeasible. This interaction produces realistic response plans rather than idealized ones.

The approach is especially powerful for compound crises -- simultaneous conflicts, climate events, and economic shocks that interact to produce displacement patterns no single-factor model can predict. The council can run hundreds of compound scenarios to identify which combinations produce catastrophic displacement events requiring early action.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Humanitarian / Predictive Forecasting]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Displacement data exists but is patchy; modeling transit decisions requires behavioral assumptions.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Early positioning of humanitarian resources saves lives and reduces costs by orders of magnitude.]],
)

#text(weight: "semibold")[Key Considerations:]

- Must handle extreme sensitivity around predicting human movement patterns
- Risk of governments using predictions to pre-emptively close borders rather than prepare
- Data on smuggling networks and informal border crossings is inherently poor
- Climate displacement models are still maturing

#text(weight: "semibold")[Next Steps:] Backtest against the 2015 European migration crisis and the 2022 Ukrainian displacement event, then build a live monitoring dashboard for three high-risk origin regions.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Constitutional Crisis Red-Teaming

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] For countries undergoing democratic stress, assign models the roles of executive, legislature, judiciary, military, and civil society to simulate how institutional crises might unfold and identify structural vulnerabilities.

Democratic backsliding rarely follows a single path -- it results from the interaction of institutional actors, each operating within their constitutional prerogatives but collectively undermining democratic norms. A multi-model council can simulate these interactions by assigning each model a key institutional role within a specific country's political system. One model embodies the executive branch's incentives and powers, another the legislature (with its actual partisan composition), a third the judiciary (with its appointment structure and independence traditions), a fourth the military (with its institutional culture and constitutional role), and a fifth civil society and media.

A scenario is introduced -- say, the executive refuses to comply with a court order, or the legislature attempts to pack the judiciary, or the military signals it won't enforce a controversial policy. Each model-institution responds according to its actual powers, historical behavioral patterns, and rational self-interest. The simulation maps whether the crisis is contained by institutional checks or cascades into democratic breakdown.

This is genuinely novel because existing democracy indices measure static conditions, not dynamic interactions. The council approach reveals which institutional weaknesses are load-bearing -- where a single failure cascades -- versus which are cosmetic. It can also identify which interventions (constitutional amendments, international pressure, civil society mobilization) would be most effective at different crisis stages.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Governance / Scenario Planning]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Requires deep constitutional and political knowledge for each country; available for well-studied democracies.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Early identification of democratic vulnerability points enables preventive action.]],
)

#text(weight: "semibold")[Key Considerations:]

- Highly sensitive -- publishing country-specific vulnerability assessments could be destabilizing
- Models may struggle with informal power dynamics that dominate many political systems
- Must account for charismatic leadership effects that override institutional logic
- Validation is difficult because constitutional crises are rare events

#text(weight: "semibold")[Next Steps:] Conduct retrospective simulations of documented democratic crises (Turkey 2016-2017, Hungary 2010-2024, Brazil 2022-2023) to validate the framework, then apply prospectively to countries currently experiencing democratic stress.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Ideological Lens Policy Analysis

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Run the same policy proposal through models prompted with distinct ideological frameworks -- realist, liberal institutionalist, constructivist, Marxist, postcolonial -- to expose hidden assumptions and blind spots in conventional analysis.

Policy analysis in foreign affairs is always conducted through an implicit theoretical lens, but this lens is rarely made explicit or challenged. A multi-model council can systematize what good academic debate does informally: subject the same policy question to genuinely different analytical frameworks. One model analyzes a proposed intervention through a strict realist lens (power distribution, balance of threat, relative gains). Another applies liberal institutionalist logic (international law, institutional constraints, absolute gains through cooperation). A third uses constructivist reasoning (identity, norms, social construction of interests). Others apply Marxist political economy, postcolonial theory, or feminist IR perspectives.

The deliberation phase is not about determining which lens is \"correct\" -- it is about identifying what each lens sees that others miss. The realist model might correctly identify that a humanitarian intervention will provoke a great power response the liberal model ignores. The postcolonial model might flag that the intervention's framing reproduces patterns that will generate local resistance the realist model overlooks. The feminist lens might identify gendered impacts on conflict dynamics that all other models miss.

The output is a multi-perspective policy brief that explicitly maps where different frameworks converge (high-confidence findings) and diverge (genuine uncertainties requiring judgment). This is far more honest and useful than the single-perspective analysis that dominates most policy shops.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Policy Analysis / Unconventional]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Models can be effectively prompted with distinct theoretical frameworks.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Improves analysis quality but requires institutional willingness to engage with uncomfortable perspectives.]],
)

#text(weight: "semibold")[Key Considerations:]

- Requires that decision-makers actually engage with perspectives they find uncomfortable
- Some theoretical frameworks may be poorly represented in training data
- Risk of performative diversity -- including perspectives without taking them seriously
- Best used early in policy formulation, not for post-hoc justification

#text(weight: "semibold")[Next Steps:] Produce multi-lens analyses of five current policy debates (e.g., Indo-Pacific strategy, Africa engagement, Arctic governance) and conduct blind evaluations with policy professionals to assess whether the council output is rated as more comprehensive than conventional single-lens analysis.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Disinformation Campaign Origin Attribution

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Multiple models independently analyze a disinformation campaign's linguistic patterns, network topology, timing coordination, and narrative alignment with state interests to produce an attribution confidence assessment through structured disagreement.

Attribution of state-sponsored disinformation campaigns is one of the hardest analytical problems in modern intelligence. Evidence is circumstantial, false flags are common, and cognitive biases toward attributing campaigns to usual suspects are strong. A multi-model council can improve attribution rigor by assigning each model a different evidential domain: one analyzes linguistic and stylistic patterns in the content itself, another maps the network topology of accounts spreading the content, a third examines timing patterns and coordination signatures, and a fourth evaluates narrative alignment with known state strategic communication objectives.

Each model produces an independent attribution assessment with confidence levels and alternative hypotheses. The deliberation phase then stress-tests each assessment: the linguistic model might point to Russian language artifacts, but the network model might show topology inconsistent with known Russian operations, suggesting a false flag by a third party. The timing model might identify patterns consistent with a specific time zone but the narrative model might find the messaging misaligned with that state's actual strategic interests.

The output is not a single attribution but a ranked probability distribution across possible sponsors, with explicit documentation of which evidence supports and contradicts each hypothesis. This structured uncertainty is far more useful to policymakers than confident but potentially wrong single-source attribution, and it provides a defensible basis for any public attribution decisions.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Intelligence Analysis / Unconventional]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Requires access to social media data and network analysis capabilities; the analytical framework is sound.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Misattribution of disinformation campaigns can lead to diplomatic crises; better attribution enables proportionate response.]],
)

#text(weight: "semibold")[Key Considerations:]

- Attribution confidence thresholds for public accusations vs. private response differ
- Adversaries will adapt techniques once they understand the detection methodology
- Must handle the possibility that some campaigns are genuinely grassroots, not state-sponsored
- Cross-platform data access is increasingly restricted

#text(weight: "semibold")[Next Steps:] Apply the council framework retrospectively to five documented and attributed disinformation campaigns (where ground truth is established) to calibrate confidence thresholds before deploying on live campaigns.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Ceasefire Durability Scoring

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] After a ceasefire agreement is reached, models representing each party, guarantor states, and spoiler groups independently assess the agreement's durability, producing a composite score that flags the most likely failure modes.

Approximately half of all ceasefires collapse within five years, but existing analysis of ceasefire durability tends to focus on the agreement's text rather than the dynamic incentives of all parties. A multi-model council creates a richer assessment by having each model embody a different stakeholder. Models representing each warring party assess whether the agreement actually addresses their core grievances and whether their leadership can sell it domestically. Models representing guarantor states evaluate whether they have the will and capacity to enforce compliance. Critically, models representing potential spoiler groups -- hardline factions, excluded armed groups, neighboring states with contrary interests -- assess their motivation and ability to undermine the agreement.

Each model produces a durability assessment from its actor's perspective, identifying the most likely triggers for collapse: economic provisions that are unimplementable, security guarantees that lack credibility, political power-sharing formulas that incentivize defection. The council synthesis highlights which failure modes multiple actors independently flag (high risk) versus those flagged by only one perspective (lower risk but worth monitoring).

The system produces a living score that updates as implementation proceeds, flagging when real-world developments align with predicted failure modes. This enables early intervention -- mediators can address emerging problems before they escalate to agreement collapse.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Conflict Resolution / Predictive Forecasting]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Requires detailed knowledge of each conflict context; general framework is transferable.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Preventing ceasefire collapse saves lives and avoids the massive costs of resumed conflict.]],
)

#text(weight: "semibold")[Key Considerations:]

- Must be sensitive to the fact that publicizing vulnerability assessments could embolden spoilers
- Needs regular updating as political dynamics shift
- Historical base rates vary significantly by conflict type and region
- Should incorporate lessons from previous collapsed agreements in the same conflict

#text(weight: "semibold")[Next Steps:] Retrospectively score five historical ceasefires (some that held, some that collapsed) to validate the scoring methodology, then deploy for one active peace process in coordination with a mediating organization.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Climate-Security Nexus Forecasting

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] One model tracks climate projections (drought, sea-level rise, extreme weather), another models agricultural and economic impacts, a third assesses political stability effects, and a fourth predicts security outcomes -- creating a causal chain from climate data to conflict risk.

The link between climate change and security is widely acknowledged but poorly modeled because it spans disciplines that rarely communicate effectively. A multi-model council can bridge these disciplinary gaps by creating a structured causal chain. The first model specializes in downscaled climate projections for specific regions -- not global averages but local precipitation, temperature, and extreme weather predictions. The second model translates these into livelihood impacts: crop yields, water availability, pastoralist route viability, coastal infrastructure vulnerability.

The third model takes these livelihood impacts and assesses political stability consequences: government revenue effects, urban migration pressure, communal competition for resources, elite capture of scarce resources. The fourth model evaluates whether these political stresses translate into security outcomes -- armed conflict, state failure, mass displacement, or international confrontation over shared resources (water, fisheries, Arctic routes).

The deliberation phase is crucial because the causal chain is not deterministic. The political stability model might argue that a specific government has institutional capacity to manage resource stress that the climate model predicts, reducing the security model's conflict probability. Or the economic model might identify adaptation pathways that break the causal chain entirely. This structured interaction produces more nuanced forecasts than end-to-end models that skip intermediate causal steps.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Climate-Security / Predictive Forecasting]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Each component model works well; the challenge is calibrating handoffs between causal stages.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Climate-security risks will dominate the coming decades; early warning enables preventive action.]],
)

#text(weight: "semibold")[Key Considerations:]

- Climate projections carry large uncertainty bands that propagate through the causal chain
- Political adaptation capacity is the hardest variable to model
- Time horizons range from near-term (5-year drought cycles) to long-term (sea-level rise)
- Must avoid environmental determinism -- climate stress is a risk factor, not a guarantee of conflict

#text(weight: "semibold")[Next Steps:] Build causal chain models for three high-vulnerability regions (Sahel, South/Southeast Asian river basins, Central American dry corridor) and compare 5-year retrospective forecasts against observed outcomes.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Nuclear Escalation Firebreak Identification

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] In a simulated conventional conflict between nuclear-armed states, models playing each side independently identify the decision points where they would consider nuclear use, revealing where escalation firebreaks exist and where they are thin.

Understanding where the boundary between conventional and nuclear conflict lies is arguably the most consequential analytical challenge in security studies. Traditional approaches rely on nuclear doctrine analysis and wargaming with human players who are reluctant to simulate nuclear use decisions. AI models do not share this psychological barrier, enabling more honest exploration of escalation dynamics.

The council assigns each model a nuclear-armed state's strategic culture, nuclear doctrine, command-and-control structure, and known red lines. A conventional conflict scenario is introduced and escalated incrementally. At each stage, each model-state privately records whether nuclear use is under consideration, what threshold would trigger it, and what type of nuclear use (demonstration, tactical battlefield, counterforce, countervalue) is being contemplated. These private assessments are revealed after each round.

The analytical value lies in identifying asymmetric perceptions: State A's model might believe it is far from the nuclear threshold while State B's model believes State A is about to cross it. These misperception gaps are where accidental nuclear escalation is most likely. The council can also identify which conventional military actions (e.g., striking early warning systems, attacking submarine ports, destroying command bunkers) are perceived by the other side as nuclear-use preparation even when intended as conventional operations.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Wargaming / Nuclear Security]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Requires careful modeling of nuclear doctrines and strategic cultures; sensitive outputs.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Understanding nuclear escalation dynamics is existentially important.]],
)

#text(weight: "semibold")[Key Considerations:]

- Extremely sensitive outputs that must be handled with classification-appropriate security
- Models may not accurately capture the psychological dynamics of actual nuclear decision-making
- Must avoid creating a \"playbook\" that could be misused
- Validation is impossible without (thankfully) real-world data

#text(weight: "semibold")[Next Steps:] Conduct controlled simulations with security-cleared nuclear strategy experts comparing AI council outputs against expert assessment to evaluate whether the approach generates credible and useful insights.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Sovereign Debt Crisis Contagion Mapping

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Models embody different financial actors -- the debtor nation, creditors (IMF, bilateral, commercial), regional neighbors, and currency markets -- to simulate how a sovereign debt crisis cascades through geopolitical relationships.

Sovereign debt crises are geopolitical events as much as economic ones. When Sri Lanka defaulted in 2022, it reshaped China-India competition in the Indian Ocean. When Greece nearly defaulted in 2015, it tested European solidarity. A multi-model council captures these political-economic interactions by assigning models distinct actor roles.

The debtor-nation model operates under actual fiscal constraints and political pressures, choosing between austerity (domestic backlash), default (creditor retaliation), or seeking new patrons (geopolitical realignment). Creditor models -- representing the IMF, bilateral lenders like China's policy banks, and commercial creditors -- each pursue different objectives: the IMF model prioritizes structural reform, the Chinese model prioritizes strategic asset access, the commercial model prioritizes recovery rates. Regional neighbor models assess spillover risks to their own economies and the strategic opportunities created by a neighbor's distress.

The council reveals dynamics that single-actor analysis misses: how IMF conditionality drives the debtor toward Chinese financing, how that shift triggers US counter-offers, how regional contagion fears motivate collective action or competitive exploitation. The multi-model approach is particularly valuable because the actors genuinely have different optimization functions and information sets, which is exactly what multi-model deliberation handles well.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Geoeconomics / Unconventional]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Financial data is excellent; political motivations of institutional creditors are well-documented.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Sovereign debt crises occur regularly and always have geopolitical consequences.]],
)

#text(weight: "semibold")[Key Considerations:]

- Must model domestic political constraints on austerity acceptance
- Debt restructuring is highly technical; models need financial engineering knowledge
- Geopolitical competition among creditors is increasingly important (China vs. Paris Club)
- Currency dynamics can accelerate or dampen contagion

#text(weight: "semibold")[Next Steps:] Reconstruct the Sri Lankan debt crisis council simulation and compare model predictions of geopolitical realignment against actual outcomes (Hambantota port dynamics, India's response, IMF program design).

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Technology Transfer and Espionage Risk Assessment

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Models representing an exporting nation, importing nation, intelligence agencies, and international regulatory bodies deliberate on specific technology transfer cases to assess proliferation and espionage risks from multiple perspectives simultaneously.

Technology export control decisions sit at the intersection of commercial interests, security concerns, alliance politics, and nonproliferation norms. Current assessment processes are sequential -- commercial officers evaluate economic impact, intelligence analysts assess diversion risk, diplomats consider alliance implications -- and each silo produces partial analysis. A multi-model council integrates these perspectives in a single deliberation.

For a specific technology transfer case (e.g., advanced semiconductor manufacturing equipment to Country X), one model embodies the exporting company and nation's commercial interests, including jobs, market share, and the risk that denial simply pushes the buyer to alternative suppliers. Another model plays the intelligence community, assessing the recipient's track record of end-use compliance, reverse engineering capability, and connections to military programs. A third represents alliance dynamics -- how allies would view the transfer, whether coordinated export controls are feasible, and whether unilateral denial is undermined by allied willingness to sell.

The council produces a structured risk-benefit assessment that makes trade-offs explicit rather than leaving them to be resolved by whichever bureaucratic actor has the most influence. This transparency is itself valuable: policymakers see clearly what they are gaining and risking with each decision, rather than receiving sanitized single-perspective recommendations.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Technology Security / Trade Policy]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Export control frameworks are well-documented; case studies are available for calibration.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Individual decisions are important but the aggregate effect on technology security architecture is the real value.]],
)

#text(weight: "semibold")[Key Considerations:]

- Classified intelligence about end-use risks cannot be incorporated into unclassified models
- Must account for rapidly evolving technology landscapes (today's controlled item is tomorrow's commodity)
- Alliance coordination on export controls is fragile and politically sensitive
- Risk of regulatory capture if commercial perspective is overweighted in the model

#text(weight: "semibold")[Next Steps:] Analyze 10 historical export control decisions (some approved, some denied) using the council framework and compare with actual proliferation outcomes where known.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Post-Conflict Power-Sharing Constitution Design

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Models embody each major faction in a post-conflict society, plus international mediators and constitutional law experts, to iteratively negotiate and stress-test power-sharing constitutional provisions before they are adopted.

Post-conflict constitutions fail when they contain provisions that incentivize one party to defect from the agreement once they gain sufficient power. The Dayton Agreement's complex power-sharing structures, Lebanon's confessional system, and Iraq's federal arrangement all contain structural incentives for future conflict that were not fully visible at the time of adoption. A multi-model council can systematically identify these failure modes.

Each model embodies a major faction with its actual demographic weight, military capability, economic assets, and core identity concerns. A proposed constitutional framework is introduced and each model-faction assesses it: does this protect my group's vital interests? Does it give another faction a path to dominance? Are the enforcement mechanisms credible? Would my constituency accept this? Models then propose amendments and the council deliberates toward a framework that all model-factions can accept.

The crucial additional step is stress-testing: the council runs the agreed constitution forward through plausible future scenarios -- demographic shifts, resource discoveries, external intervention, economic crisis. Which constitutional provisions break under stress? Which factions have incentives to exploit ambiguities? This prospective failure analysis is something human constitution-drafting processes, under time pressure and political urgency, almost never do systematically.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Governance / Conflict Resolution / Unconventional]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Constitutional design is complex and context-specific; the framework adds value but cannot replace human negotiation.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Constitutional failure is a leading cause of conflict recurrence.]],
)

#text(weight: "semibold")[Key Considerations:]

- Models must avoid imposing Western constitutional assumptions on non-Western contexts
- Power-sharing designs interact with electoral systems, judicial structures, and resource allocation in complex ways
- Must account for the role of external guarantors in making provisions credible
- Timing matters -- what is acceptable during a peace process window may not be later

#text(weight: "semibold")[Next Steps:] Retrospectively apply the council framework to the Dayton Agreement, assessing whether it would have identified the structural weaknesses that have plagued Bosnia's governance, then explore application to an active peace process.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Maritime Chokepoint Disruption Scenario Planning

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Models represent each nation with interests in a specific maritime chokepoint (Strait of Hormuz, Malacca, Bab el-Mandeb), simultaneously simulating disruption scenarios and revealing how quickly regional incidents become global crises.

Global trade depends on a handful of maritime chokepoints, and disruption at any of them has cascading effects far beyond the immediate region. The Houthi attacks on Red Sea shipping in 2024-2025 demonstrated this vividly but caught many policymakers off guard despite decades of theoretical analysis. A multi-model council makes the cascading dynamics visceral and specific.

For a Strait of Hormuz disruption scenario, models represent Iran (the disruptor), the US Navy (the primary security provider), Gulf Arab states (whose economies depend on the strait), China and India (major oil importers), global shipping companies (who make routing decisions), and insurance markets (whose pricing affects everything). When the disruption is introduced, each actor responds according to its actual capabilities and incentives, and these responses interact.

The shipping model might reroute around the Cape of Good Hope, adding 10-15 days of transit time. The insurance model reprices war risk premiums, making some cargoes uneconomical. The Chinese model activates its Strategic Petroleum Reserve while accelerating pipeline alternatives. The Gulf Arab model assesses whether to attempt unilateral de-escalation or demand US military action. Each response changes the calculus for every other actor.

This reveals dynamics that single-perspective analysis misses: the lag between disruption and oil price impact, the divergence between US and Asian interests in response strategy, the role of insurance markets as a transmission mechanism, and the timeline for alternative routing to become operational.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Maritime Security / Scenario Planning]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Shipping data, military capabilities, and economic dependencies are well-documented.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Maritime chokepoint disruption is a high-probability scenario with massive economic consequences.]],
)

#text(weight: "semibold")[Key Considerations:]

- Must model the difference between partial disruption (harassment) and full blockade
- Insurance and financial market dynamics are critical transmission mechanisms often overlooked
- Duration of disruption dramatically affects which alternatives become viable
- Need to account for environmental constraints on alternative routing (e.g., ice in Northern Sea Route)

#text(weight: "semibold")[Next Steps:] Build a council simulation for each of the five critical chokepoints and run 50 disruption scenarios each, producing a comparative vulnerability assessment with policy recommendations.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Generational Leadership Transition Forecasting

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] For countries approaching leadership transitions (aging autocrats, term-limited democrats, succession-unclear regimes), models embody different successor candidates and power centers to simulate post-transition policy trajectories.

Leadership transitions in major powers and regional pivotal states are among the highest-impact, lowest-confidence forecasting challenges. When a long-serving leader exits -- whether Xi Jinping, Erdogan, Khamenei, or Putin -- the successor's policy direction is deeply uncertain. Multi-model deliberation can structure this uncertainty by assigning models to different potential successors and power centers within the regime.

For a hypothetical Iranian succession scenario, one model embodies the IRGC institutional perspective, another the clerical establishment, a third the technocratic reformist faction, and a fourth the supreme leader's personal office network. Each model-faction assesses: which successor candidate serves my institutional interests? What policy changes would I push for or resist? What resources do I control to influence the succession? The council simulates the bargaining process that produces a new leader and the compromises embedded in their mandate.

The output is not a prediction of who will succeed but a structured map of post-transition possibility space: under Successor A (IRGC-backed), nuclear negotiations restart but with harder terms; under Successor B (clerical establishment), domestic repression increases but foreign policy moderates; under Successor C (technocratic), economic reform accelerates but faces institutional resistance. Each trajectory includes the key variables that would determine which path materializes, giving policymakers a monitoring framework rather than a fixed prediction.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Political Forecasting / Unconventional]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#c62828"))[Low-Medium - Succession dynamics in opaque regimes are poorly understood; models may not capture informal power networks.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Leadership transitions in major powers reshape international politics for decades.]],
)

#text(weight: "semibold")[Key Considerations:]

- Information about internal regime dynamics is scarce and often outdated
- Must avoid the trap of projecting known figures' views onto institutional roles
- Transitions can be triggered by unexpected events (health crises, coups) that are inherently unpredictable
- The act of forecasting succession can itself become a political factor if leaked

#text(weight: "semibold")[Next Steps:] Retrospectively model past transitions (Soviet succession post-Brezhnev, Chinese succession post-Deng, Saudi succession 2015) to evaluate whether the council approach would have identified the eventual trajectory.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Pandemic Treaty Negotiation Simulation

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Models represent WHO, major pharmaceutical-producing nations, low-income countries, and the private pharmaceutical sector to simulate negotiations over pandemic preparedness treaty provisions, identifying deal-breaking provisions before real negotiations stall.

The post-COVID pandemic treaty negotiations have struggled for years because the core tensions -- intellectual property access vs. innovation incentives, sovereignty vs. global coordination, equitable access vs. domestic political pressure to prioritize nationals -- involve genuinely different optimization functions across actors. A multi-model council can map the negotiation space more efficiently than sequential human rounds.

Each model embodies a negotiating bloc with its actual interests and constraints. The pharmaceutical-industry model optimizes for IP protection and market incentives while acknowledging reputational pressure to demonstrate social responsibility. The low-income country coalition model prioritizes access guarantees and technology transfer but recognizes its limited leverage. The US/EU model balances pharmaceutical industry domestic interests against the security argument for global pandemic preparedness. The WHO model seeks the broadest possible agreement while knowing it has limited enforcement capacity.

The council runs hundreds of negotiation simulations with different opening positions, sequencing strategies, and package deals. It identifies which provisions are universally acceptable, which are universally opposed, and -- most valuably -- which provisions are tradeable: provisions that one bloc cares intensely about but others would concede for reciprocal concessions elsewhere. This trade-space mapping accelerates actual negotiations by showing mediators where productive compromise zones exist.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Global Health Governance / Diplomatic Simulation / Unconventional]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Negotiating positions are publicly documented; the framework directly mirrors actual multilateral negotiation dynamics.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium-High - Pandemic preparedness treaty design affects global response capacity for the next inevitable pandemic.]],
)

#text(weight: "semibold")[Key Considerations:]

- Negotiating blocs are not monolithic -- internal divisions within the G77 or EU must be modeled
- Must account for domestic ratification constraints, not just negotiator preferences
- The pharmaceutical industry's private interests may not align with the governments that represent them
- Pandemic preparedness competes for political attention with other global governance priorities

#text(weight: "semibold")[Next Steps:] Map the current state of pandemic treaty negotiations, identify the three most contentious provisions, and run council simulations to produce a compromise package for each, then share findings with a participating delegation for feedback on realism.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Historical Counterfactual Stress-Testing for Current Strategy

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Run current strategic assumptions through historical counterfactual scenarios -- \"what if the Soviet Union hadn't collapsed?\" or \"what if China hadn't opened economically?\" -- to identify which elements of current strategy depend on historically contingent conditions that could change.

Strategic planning often embeds assumptions that are artifacts of specific historical outcomes rather than durable structural conditions. The assumption that economic interdependence constrains conflict, that nuclear deterrence is stable, or that US naval dominance secures global trade all rest on historically contingent foundations. A multi-model council can expose these dependencies by running counterfactual historical scenarios.

The council assigns each model a role in the counterfactual world: in a scenario where the Soviet Union reformed but survived, one model embodies a reformed USSR, another a US that never experienced its \"unipolar moment,\" a third a Europe that never integrated as deeply, and a fourth a China that developed differently without the post-Cold War globalization wave. The models then deliberate: what would the current strategic challenge (say, Indo-Pacific security) look like in this alternative world? Which elements of current strategy would still work and which would be irrelevant?

This is not an academic exercise. It reveals which strategic assumptions are robust across historical scenarios (likely structurally sound) versus which only work because of specific historical accidents (fragile and potentially outdated). If a strategy for managing China depends entirely on conditions created by the Soviet collapse, that strategy has a hidden fragility. If it works across multiple counterfactual scenarios, it is more robust. Policymakers can then prioritize shoring up fragile assumptions or developing alternatives.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Strategic Analysis / Unconventional]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Counterfactual analysis is intellectually challenging but models can engage with hypothetical scenarios effectively.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Improves strategic robustness but requires policymakers willing to question foundational assumptions.]],
)

#text(weight: "semibold")[Key Considerations:]

- Counterfactual scenarios can spiral into unfalsifiable speculation without disciplined constraints
- Must limit the number of variables changed to keep scenarios analytically tractable
- Results are inherently uncertain but the exercise value lies in revealing hidden assumptions
- Some counterfactuals are more plausible and therefore more useful than others

#text(weight: "semibold")[Next Steps:] Select three foundational assumptions underlying current US Indo-Pacific strategy, design counterfactual scenarios that would invalidate each, and run council simulations to assess which strategic elements survive across scenarios.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))


// ─── Part 3 Divider ───

#page(footer: none)[
  #v(6cm)
  #align(center)[
    #text(size: 13pt, weight: "regular", fill: rgb("#90a4ae"), tracking: 0.15em)[
      PART 3
    ]

    #v(0.6cm)

    #text(size: 24pt, weight: "bold", fill: rgb("#1a237e"))[
      Geopolitical Fora Amenable to Predictive Modelling
    ]

    #v(0.8cm)

    #line(length: 30%, stroke: 1pt + rgb("#b0bec5"))

    #v(0.5cm)

    #text(size: 11pt, fill: rgb("#78909c"))[
      21 ideas
    ]
  ]
]

= Geopolitical Fora Amenable to Predictive Modelling

== United Nations Security Council (UNSC)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] The premier international security body with 15 members, permanent-member veto mechanics, and decades of publicly documented voting records.

The UNSC is arguably the most modelable high-stakes geopolitical body in existence. It has exactly 15 members at any given time -- five permanent members (P5) with veto power and ten rotating non-permanent members elected for two-year terms. Every substantive resolution requires nine affirmative votes and no P5 veto. Procedural votes require nine affirmative votes without veto application.

What makes the UNSC exceptionally tractable for AI simulation is the combination of a small, fixed membership with crystal-clear voting rules and an enormous historical dataset. Every vote since 1946 is publicly recorded, including explanations of vote. The veto mechanic creates a binary constraint that dramatically narrows the outcome space -- any simulation engine can immediately prune branches where a P5 member signals opposition. Position papers, statements, and draft resolutions are routinely circulated in advance.

The rotating membership does introduce calibration complexity, but the ten elected seats tend to follow regional-group patterns that are themselves predictable. Assigning AI agents to each member state with historically-calibrated policy positions and alliance weights is straightforward, and the procedural constraints make outcome enumeration computationally feasible.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: International Security / Multilateral Governance]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Comprehensive voting records, well-defined veto mechanics, small membership, extensive academic literature on voting patterns.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - UNSC decisions directly affect sanctions, peacekeeping operations, and use-of-force authorizations globally.]],
)

#text(weight: "semibold")[Key Considerations:]

- Behind-the-scenes negotiations (penholding, informal consultations) are not captured in public records
- Veto threats that prevent votes from being called are a major source of hidden influence
- P5 positions are often shaped by bilateral relationships outside the UNSC context
- Draft resolution language is frequently negotiated to avoid vetoes, creating a selection bias in the observable record

#text(weight: "semibold")[Next Steps:] Build a historical voting database from UN Digital Library records; calibrate P5 agent positions using foreign ministry statements and prior veto patterns; model the veto-threat dynamic as a pre-vote filtering stage.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== OPEC+ Ministerial Conference

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A cartel of roughly 23 oil-producing nations that makes quantified production quota decisions through a well-documented consensus process.

OPEC+ combines the 13 OPEC members with approximately 10 non-OPEC partners (the \"+\" group) to coordinate oil production levels. What makes this body uniquely modelable is that its decisions are fundamentally quantitative -- production quotas in barrels per day -- and the key variables driving each member's position are measurable: fiscal breakeven oil price, production capacity, spare capacity, GDP dependence on oil revenue, and current compliance rates.

The decision-making process follows a predictable calendar of ministerial meetings (typically every few months) with a Joint Ministerial Monitoring Committee (JMMC) that prepares recommendations. Decisions are nominally by consensus, but in practice Saudi Arabia and Russia hold dominant influence as the two largest producers. The observable compliance data (actual production vs. quota) provides a continuous feedback signal for calibrating how seriously each member treats its commitments.

Historical production data, quota assignments, and meeting outcomes are publicly available going back decades. The economic incentive structure for each member is relatively transparent -- each country's budget depends on oil revenue in well-documented ways. This makes OPEC+ one of the few geopolitical bodies where agent utility functions can be grounded in hard economic data rather than inferred from rhetoric.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Energy / Economic Coordination]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Quantitative decisions, measurable economic incentives, regular meeting cadence, extensive historical data.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Production decisions directly move global oil prices, affecting inflation, trade balances, and geopolitical leverage worldwide.]],
)

#text(weight: "semibold")[Key Considerations:]

- Saudi Arabia's willingness to act as swing producer introduces a dominant-actor dynamic
- Compliance cheating is endemic and difficult to model deterministically
- Geopolitical side-deals (e.g., US-Saudi security arrangements) influence positions in ways not captured by economic models alone
- The \"+  \" partners have varying commitment levels to the framework

#text(weight: "semibold")[Next Steps:] Construct per-member fiscal models linking oil price to budget balance; build a compliance prediction layer using historical quota vs. actual production; simulate Saudi swing-producer strategies as a separate decision layer.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Basel Committee on Banking Supervision (BCBS)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 28-member committee of central bank governors and supervisory authorities that sets global banking standards through consensus-based deliberation.

The Basel Committee comprises representatives from 28 jurisdictions and operates by consensus to produce banking regulation standards (Basel I, II, III, and the ongoing Basel 3.1/Endgame framework). While its outputs are technically non-binding, they function as de facto global standards because national regulators almost universally adopt them. The committee's membership is fixed, its mandate is narrow (banking prudential standards), and its deliberative process follows a structured cycle of consultation papers, quantitative impact studies, and final standards.

The modelability of the BCBS stems from several factors. Each member's position can be substantially predicted from their domestic banking sector structure -- jurisdictions with large, internationally active banks (US, UK, EU) tend to resist capital increases, while those with smaller banking sectors may favor stricter standards. The quantitative impact studies (QIS) that precede every major decision provide hard data on how proposed rules would affect each jurisdiction's banks, making it possible to estimate each member's cost-benefit calculation.

The consensus requirement means that outlier positions must be accommodated, and the historical pattern of Basel negotiations shows consistent dynamics: large banking centers push for flexibility, smaller jurisdictions push for simplicity, and the final standard reflects a compromise. This makes the negotiation space relatively low-dimensional compared to general foreign policy bodies.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Financial Regulation / Standard-Setting]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Narrow mandate, quantifiable impacts via QIS data, consensus-based process, positions predictable from banking sector structure.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Standards shape global banking regulation but implementation is national and often delayed or modified.]],
)

#text(weight: "semibold")[Key Considerations:]

- The EU often negotiates as a bloc, reducing effective membership for modelling purposes
- Technical complexity of standards means domain expertise is required to model positions accurately
- Implementation timelines and national deviations from Basel standards are a separate modelling challenge
- Industry lobbying influences national positions in ways that may not be publicly visible

#text(weight: "semibold")[Next Steps:] Map each member jurisdiction's banking sector profile (concentration, international exposure, capital ratios); analyze QIS response data to calibrate position predictions; model the consensus-building process as iterative position adjustment.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== International Whaling Commission (IWC)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 88-member body with simple majority voting, transparent bloc dynamics, and a decades-long binary policy dispute that makes voting patterns highly predictable.

The IWC is a surprisingly excellent candidate for predictive modelling despite its large membership because the politics reduce to a single dominant axis: pro-whaling versus anti-whaling. This one-dimensional policy space means that each member's position can be encoded as a single variable, and voting outcomes can be predicted by counting bloc sizes. The IWC uses simple majority voting for most decisions and three-quarters majority for schedule amendments (which include catch quotas).

The body has a well-documented history of \"vote-buying\" by Japan through overseas development assistance to small island states, creating a dynamic where membership composition itself is a strategic variable. This adds a fascinating meta-layer to the model: predicting which states will join or leave the IWC as a function of Japanese aid flows and anti-whaling diplomatic pressure. The IWC's published voting records are complete and unambiguous, and each country's position is generally stable and publicly stated.

The simplicity of the policy space, combined with transparent bloc membership and clear voting rules, makes the IWC an ideal testbed for multi-agent simulation -- not because its decisions are globally important, but because the system is tractable enough to validate modelling approaches before applying them to more complex bodies.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Environmental Governance / International Organization]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - One-dimensional policy space, complete voting records, stable bloc membership, transparent influence dynamics.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#c62828"))[Low - Limited to whaling policy, but high value as a validation testbed for modelling methodologies.]],
)

#text(weight: "semibold")[Key Considerations:]

- Japan's 2019 withdrawal from the IWC significantly changed dynamics
- Small-state recruitment by both blocs makes membership endogenous to the model
- The moratorium on commercial whaling means most votes are about maintaining or lifting the status quo
- Aboriginal subsistence whaling creates a cross-cutting issue that complicates the simple binary framing

#text(weight: "semibold")[Next Steps:] Build a complete historical voting matrix from IWC records; construct a bloc-membership prediction model using ODA flows and diplomatic indicators; use the IWC as a benchmark for validating multi-agent simulation frameworks.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== European Council (EU Heads of State)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] The 27-member supreme political body of the EU with qualified majority voting rules that create precise, calculable winning coalitions.

The European Council, comprising the heads of state or government of the 27 EU member states, makes decisions using one of the most formally specified voting systems in international politics: qualified majority voting (QMV). Under QMV, a decision requires at least 55% of member states (15 out of 27) representing at least 65% of the EU population. A blocking minority requires at least four member states representing more than 35% of the population. These precise numerical thresholds make coalition mathematics directly computable.

Each member state's vote weight is fixed (determined by population), and the dual-threshold system creates a defined space of winning and blocking coalitions that can be fully enumerated. National positions on EU policy areas are extensively documented through Council working group minutes, national parliament debates, and a robust political science literature on EU voting behavior. The EURACTIV and VoteWatch Europe databases provide detailed tracking of member state positions.

The predictive modelling opportunity is enhanced by the fact that EU member states have relatively stable policy preferences along well-studied dimensions (integration vs. sovereignty, north-south fiscal policy, east-west rule-of-law tensions). These preference dimensions have been mapped by multiple academic research programs, providing calibration data that does not exist for most international bodies.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Regional Governance / Supranational Decision-Making]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Precisely defined QMV rules, population-weighted votes, extensive academic datasets on national preferences, VoteWatch Europe tracking.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - EU decisions affect 450 million people across trade, regulation, foreign policy, and fiscal coordination.]],
)

#text(weight: "semibold")[Key Considerations:]

- Many decisions are made by unanimity (foreign policy, taxation), where any single state can block
- The presidency rotation influences agenda-setting in ways that matter
- Franco-German coordination often pre-determines outcomes before formal voting
- The European Commission's proposal power shapes the decision space that the Council votes on

#text(weight: "semibold")[Next Steps:] Integrate VoteWatch Europe data with national preference maps from Chapel Hill Expert Survey; implement the QMV calculator as a hard constraint in the simulation; model Franco-German pre-coordination as a bilateral sub-game.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Nuclear Suppliers Group (NSG)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 48-member export control regime operating by consensus, where a single member (often one) can block changes to nuclear trade rules.

The NSG coordinates export controls on nuclear and nuclear-related dual-use materials among 48 participating governments. All decisions require consensus, meaning any single member can effectively veto changes to the group's guidelines. This consensus requirement, combined with the narrow technical mandate, creates a highly structured decision environment.

The NSG's modelability comes from the fact that member positions on key issues are well-documented and relatively stable. The most prominent ongoing issue -- India's membership application -- has been blocked by a small number of states (primarily China, with support from a few others) for over a decade. This kind of persistent, well-defined disagreement is ideal for modelling because the positions are known, the blocking dynamics are clear, and the question reduces to whether specific states change their positions.

The group's guidelines are technical documents with specific, enumerable provisions. When amendments are proposed, the impact on each member's nuclear industry and non-proliferation commitments can be assessed. This makes it possible to construct utility functions grounded in each member's nuclear energy program, non-proliferation commitments, and bilateral relationships with nuclear-aspirant states.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Non-Proliferation / Export Control]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Consensus requirement makes blocking easy to model; however, deliberations are confidential and position data is limited.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - NSG guidelines shape global nuclear trade but enforcement is national.]],
)

#text(weight: "semibold")[Key Considerations:]

- Deliberations are conducted in strict confidence, limiting observational data
- China's blocking of India's membership is the dominant issue, potentially overshadowing other dynamics
- The relationship between NSG decisions and NPT obligations creates a complex legal backdrop
- Some members have minimal nuclear industries and may be influenced by alliance politics rather than technical interests

#text(weight: "semibold")[Next Steps:] Map each member's nuclear energy program and non-proliferation treaty commitments; construct a bilateral-relationship matrix focusing on nuclear cooperation agreements; model consensus-blocking as a function of the least-willing member's position.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== International Monetary Fund Executive Board

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 24-member board with weighted voting shares that makes lending and policy decisions through a well-defined governance structure.

The IMF Executive Board has 24 directors representing 190 member countries, with voting power weighted by financial contributions (quota shares). The largest shareholders -- the US (16.5%), Japan (6.1%), China (6.1%), Germany (5.3%), France (4.0%), and the UK (4.0%) -- collectively hold substantial blocking power, and the US alone can veto decisions requiring an 85% supermajority (such as quota changes or SDR allocations).

The weighted voting system makes coalition mathematics precise and computable. For ordinary decisions (simple majority of votes cast), the winning coalition calculation is straightforward. For special majority decisions (70% or 85%), the constraint space is even more tightly defined. The US veto on 85% decisions is a hard structural feature analogous to the P5 veto at the UNSC.

Lending decisions follow a documented framework (program conditionality, debt sustainability analysis) that constrains the decision space. Board members' positions can be predicted from their constituencies' economic interests, existing exposure to borrowing countries, and geopolitical alignment. The IMF publishes extensive documentation for each lending decision, including staff reports that reveal the analytical basis for decisions.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: International Finance / Multilateral Governance]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Weighted votes are public, decision frameworks are documented, staff reports provide analytical transparency, historical precedents are extensive.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - IMF decisions affect sovereign lending, financial stability, and economic policy conditionality globally.]],
)

#text(weight: "semibold")[Key Considerations:]

- Constituency groups (where one director represents multiple countries) introduce an aggregation problem
- The Managing Director's agenda-setting power and staff recommendations heavily influence outcomes
- Geopolitical considerations (e.g., lending to Ukraine) can override the technical framework
- The board rarely votes formally -- most decisions are reached by \"consensus\" where the chair assesses \"the sense of the meeting\" based on vote weights

#text(weight: "semibold")[Next Steps:] Build a weighted voting model using current quota shares; calibrate director positions using published country statements and constituency composition; model the staff-recommendation influence as a Bayesian prior that directors update based on national interests.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Arctic Council

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] An 8-member intergovernmental forum with consensus-based decision-making, a narrow geographical mandate, and increasingly high-stakes resource and sovereignty disputes.

The Arctic Council comprises eight Arctic states (Canada, Denmark/Greenland, Finland, Iceland, Norway, Russia, Sweden, and the US) plus six indigenous Permanent Participant organizations. Decisions are made by consensus among the eight state members. The small, fixed membership and narrow geographic mandate make it an attractive modelling target.

The Council's tractability is enhanced by the fact that each member's Arctic interests are well-documented and relatively stable: territorial claims, resource extraction rights, shipping routes, indigenous rights, environmental protection, and military positioning. These interests can be mapped to specific policy positions on the Council's working groups and task forces. The biennial ministerial declarations provide a structured output that can be compared across time.

The Russia-West tension since 2022 has fundamentally altered Council dynamics, with seven members pausing cooperation with Russia. This creates an interesting modelling challenge: simulating the conditions under which normal operations might resume, or how the Council adapts to functioning as a de facto 7-member body. The binary nature of the current disruption (cooperation vs. non-cooperation with Russia) simplifies the state space considerably.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Regional Governance / Environmental-Security]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Very small membership and clear interests, but consensus-based process and current geopolitical disruption limit historical precedent for current dynamics.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Growing importance due to climate change opening Arctic resources and shipping routes.]],
)

#text(weight: "semibold")[Key Considerations:]

- The current pause in Russia cooperation makes historical patterns less predictive
- Indigenous Permanent Participants have consultation rights but not decision-making power
- Observer states (including China) exert influence from outside the formal structure
- The Council has no enforcement mechanism -- its outputs are declarations and guidelines, not binding law

#text(weight: "semibold")[Next Steps:] Profile each member's Arctic strategy document; model the Russia cooperation/non-cooperation decision as a binary state variable linked to broader geopolitical conditions; simulate resource-access negotiations as the ice retreats.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Missile Technology Control Regime (MTCR)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 35-member informal export control partnership with consensus decision-making and a narrow, technically defined mandate around missile proliferation.

The MTCR is an informal political understanding among 35 states to limit the proliferation of missiles and missile technology capable of delivering weapons of mass destruction. Like the NSG, it operates by consensus, but its narrower technical scope (missiles and unmanned aerial vehicles capable of delivering 500kg+ payloads to 300km+ range) makes the decision space even more constrained.

The regime's guidelines are technically specific -- they categorize controlled items into Category I (complete missile systems and major subsystems, where there is a \"strong presumption of denial\") and Category II (dual-use components, where case-by-case review applies). Licensing decisions follow these categories, and member positions are largely predictable from their defense industrial base, alliance commitments, and relationships with missile-aspirant states.

The MTCR's modelability is enhanced by its narrow scope: most debates center on whether specific transfers to specific countries should be permitted. The key variables -- the exporting state's defense industry interests, the recipient state's missile program status, and alliance relationships -- are well-documented through defense trade publications and open-source intelligence.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Non-Proliferation / Arms Control]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Technically well-defined scope, but confidential deliberations and limited public records of internal debates.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Shapes global missile proliferation but effectiveness is undermined by non-member suppliers (China, notably, is not a member).]],
)

#text(weight: "semibold")[Key Considerations:]

- Deliberations are confidential with no published voting records
- The informal nature means there is no treaty text to enforce
- Members may unilaterally deviate from guidelines without formal consequences
- China and Israel are notable non-members whose behavior affects the regime's relevance

#text(weight: "semibold")[Next Steps:] Map each member's missile/space launch industry and defense export portfolio; identify historical cases where transfers were debated to calibrate positions; model the consensus-blocking dynamic as a function of bilateral defense relationships with recipient states.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Organization for the Prohibition of Chemical Weapons (OPCW) Executive Council

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 41-member rotating council with regional group representation and two-thirds majority voting on key decisions related to chemical weapons compliance.

The OPCW Executive Council has 41 members elected from five regional groups for two-year terms. It oversees implementation of the Chemical Weapons Convention and makes decisions on inspections, compliance disputes, and technical cooperation. Substantive decisions require a two-thirds majority, while procedural matters need a simple majority.

The Council's modelability benefits from the narrow, technical mandate and the structured regional-group representation. Each regional group has allocated seats, and the positions of members within each group tend to cluster around shared interests (developing vs. developed country perspectives on technical assistance, alliance-based positions on compliance disputes). The high-profile Syria attribution cases demonstrated that voting patterns align closely with geopolitical blocs, making positions predictable from alliance membership.

The OPCW publishes Council decisions, reports, and meeting records that provide calibration data. The binary nature of compliance disputes (is a state party in violation or not?) creates a structured decision space. The 2018 decision to grant the OPCW attribution authority -- taken by the Conference of States Parties over Russian objections -- demonstrated that voting outcomes can be predicted from Cold War-legacy alliance patterns with high accuracy.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Arms Control / International Law]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Published decisions and regional-group structure aid modelling, but rotating membership requires continuous recalibration.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - OPCW decisions affect chemical weapons compliance enforcement and set precedents for international accountability.]],
)

#text(weight: "semibold")[Key Considerations:]

- Rotating membership means the modelling target changes every two years
- The Syria cases have become highly politicized, reducing the technical-deliberation character of the body
- Russia's opposition to attribution authority creates a persistent structural tension
- Technical secretariat recommendations strongly influence Council decisions

#text(weight: "semibold")[Next Steps:] Build a regional-group preference model using historical voting data on Syria-related decisions; map rotating membership patterns to predict future Council composition; simulate compliance dispute outcomes under different membership scenarios.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== International Court of Justice (ICJ)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 15-judge international court with individually documented voting patterns, published dissents, and a structured deliberative process that maps well to agent-based simulation.

The ICJ has 15 judges elected for nine-year terms, with no two judges sharing the same nationality. Decisions are by simple majority, and every judge's vote is publicly recorded along with individual or dissenting opinions. This level of individual-level transparency is rare in international bodies and makes the ICJ exceptionally amenable to per-agent modelling.

Each judge's legal philosophy, national background, and voting history can be analyzed to construct an agent profile. Academic research has extensively documented patterns: judges from P5 countries tend to vote in favor of their home state's position, civil law tradition judges reason differently from common law tradition judges, and judges from developing countries tend to favor sovereignty-based arguments. These documented tendencies provide calibration data for agent construction.

The ICJ's deliberative process is further structured by the written and oral proceedings that precede judgment. The legal arguments presented by parties define the decision space, and the applicable legal sources (treaties, customary international law, prior ICJ decisions) constrain the reasoning. This means that simulation can incorporate both the policy preferences of judges and the legal constraints that limit the outcome space.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: International Law / Judicial Body]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Individual voting records, published opinions, extensive academic analysis of judicial behavior, structured legal reasoning.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - ICJ judgments are authoritative statements of international law but compliance is voluntary and enforcement depends on the UNSC.]],
)

#text(weight: "semibold")[Key Considerations:]

- Ad hoc judges appointed for specific cases change the panel composition
- The distinction between contentious cases and advisory opinions affects voting dynamics
- Legal reasoning introduces constraints that pure policy-preference models miss
- Small sample size (a few cases per year) limits statistical calibration

#text(weight: "semibold")[Next Steps:] Build individual judge profiles from voting records and published opinions; incorporate legal-reasoning constraints using NLP analysis of past judgments; simulate pending cases by assigning agent positions based on the parties' legal arguments and judge backgrounds.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Financial Action Task Force (FATF) Plenary

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 39-member body that maintains grey and black lists of jurisdictions through a peer-review evaluation process with defined criteria.

The FATF plenary brings together 39 members (37 jurisdictions and 2 regional organizations) to set anti-money laundering and counter-terrorist financing standards. Its most consequential decisions involve placing jurisdictions on the \"grey list\" (increased monitoring) or \"black list\" (high-risk, call for counter-measures) based on mutual evaluation reports. These listing decisions follow a structured methodology with 40 specific recommendations and 11 immediate outcomes that are scored.

The modelability of FATF stems from the relatively mechanical nature of listing decisions. Each evaluated jurisdiction is scored against defined criteria, and the plenary's role is to review and endorse these assessments. While political considerations can influence marginal cases, the scoring framework provides a quantitative basis for prediction. The key modelling question becomes: for a jurisdiction on the borderline, which FATF members will push for listing and which will advocate forbearance?

Member positions on listing decisions are predictable from bilateral relationships -- states with strong trade or diplomatic ties to the evaluated jurisdiction tend to argue for more lenient treatment. This creates a modelable influence network where economic and diplomatic links predict voting behavior.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Financial Governance / Anti-Money Laundering]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Scoring methodology is published, evaluation reports are public, listing criteria are defined, and bilateral-relationship data is available.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - FATF grey/black listing has massive economic consequences for listed jurisdictions, affecting banking access and capital flows.]],
)

#text(weight: "semibold")[Key Considerations:]

- The technical scoring framework constrains but does not fully determine listing outcomes
- Regional bodies (FSRBs) conduct evaluations for non-FATF members, adding a layer of delegation
- Turkey, Pakistan, and other politically significant states have had grey-listing influenced by geopolitical considerations
- The consensus-based decision process means even one influential member can delay listing

#text(weight: "semibold")[Next Steps:] Build a scoring model from published mutual evaluation reports; construct a bilateral-relationship matrix predicting member positions on borderline cases; backtest against historical grey-list movements.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== World Heritage Committee (UNESCO)

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 21-member rotating committee that makes binary inscription/non-inscription decisions based on defined criteria, with published nomination dossiers and advisory body recommendations.

The World Heritage Committee has 21 state party members elected for four-year terms from regional groups. It decides whether to inscribe nominated sites on the World Heritage List based on ten defined criteria (six cultural, four natural). Each nomination is evaluated by advisory bodies (ICOMOS for cultural sites, IUCN for natural sites) that provide formal recommendations: inscribe, refer, defer, or not inscribe.

This is a highly modelable system because the decision has a discrete outcome (inscribe or not), the criteria are published, the advisory body recommendations are public, and the committee's historical tendency to override advisory recommendations is well-documented and statistically analyzable. Research shows the committee inscribes sites against negative ICOMOS/IUCN recommendations approximately 30-40% of the time, and these overrides follow predictable patterns related to the nominating state's diplomatic influence and regional solidarity.

The committee's rotation and regional-group structure mean that the probability of inscription varies with committee composition, creating a dynamic that can be modelled as a function of which states hold seats. Vote-trading and regional solidarity are well-documented features that make agent positions partially predictable from group membership.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Cultural Governance / International Organization]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Binary outcomes, published criteria, advisory body recommendations, complete historical records of inscription decisions and overrides.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#c62828"))[Low - World Heritage inscription has symbolic and tourism-economic significance but limited hard geopolitical consequence.]],
)

#text(weight: "semibold")[Key Considerations:]

- The committee frequently overrides expert advisory body recommendations, making pure criteria-based prediction insufficient
- Regional solidarity and vote-trading are endemic but difficult to observe directly
- The Danger List and delisting decisions add complexity beyond simple inscription
- Politicization of nominations (e.g., Palestine-related sites) introduces geopolitical dynamics

#text(weight: "semibold")[Next Steps:] Build a historical database of nominations, advisory recommendations, and committee decisions; model override probability as a function of nominating state's diplomatic weight and committee composition; simulate inscription outcomes under different committee compositions.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== International Atomic Energy Agency (IAEA) Board of Governors

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 35-member board with defined regional seat allocations that makes safeguards compliance decisions critical to nuclear non-proliferation.

The IAEA Board of Governors has 35 members: 13 designated by the outgoing board based on nuclear technology advancement, and 22 elected by the General Conference from regional groups. The Board makes decisions on safeguards agreements, non-compliance findings, and referrals to the UNSC. Most decisions are by simple majority, with two-thirds required for budget and certain other matters.

The Board's modelability is enhanced by the narrow nuclear mandate and the predictable alignment patterns. On non-compliance issues (Iran, North Korea, Syria historically), voting has followed a consistent East-West pattern with the Non-Aligned Movement states forming a swing bloc. The positions of major nuclear powers are stable and well-documented through years of diplomacy on nuclear issues.

What makes the Board particularly interesting for simulation is the escalation ladder: a non-compliance finding can be referred to the UNSC, creating a direct link between IAEA Board dynamics and Security Council action. Modelling this two-stage process -- Board vote followed by potential UNSC action -- provides a richer simulation environment than either body alone.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Non-Proliferation / Nuclear Governance]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Regional-group patterns and major-power positions are predictable, but rotating membership and the technical nature of safeguards findings require domain expertise.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - Board decisions on non-compliance can trigger UNSC referrals and shape nuclear crisis diplomacy.]],
)

#text(weight: "semibold")[Key Considerations:]

- The Director General's reports significantly frame Board deliberations
- Non-Aligned Movement solidarity on nuclear issues creates a predictable bloc dynamic
- The distinction between technical safeguards findings and political judgments blurs in practice
- Iran-related decisions have consumed disproportionate Board attention, potentially biasing historical data

#text(weight: "semibold")[Next Steps:] Map historical Board voting patterns on non-compliance issues by regional group; model the NAM swing-bloc dynamic; construct a two-stage simulation linking Board decisions to UNSC referral outcomes.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Codex Alimentarius Commission

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 189-member food standards body whose decisions follow an 8-step elaboration process with defined committee structures and voting thresholds, creating a highly proceduralized decision pipeline.

The Codex Alimentarius Commission, jointly run by the WHO and FAO, sets international food safety and quality standards. Despite its large membership, it is highly modelable because its standard-setting follows a rigid 8-step elaboration procedure. Each standard must pass through committee drafting, member comment rounds, and two plenary approvals. The procedural rigidity means the stage of a standard in the pipeline strongly predicts its trajectory.

The Commission's committees are organized by subject matter (pesticide residues, food hygiene, food labelling, etc.) and by region. Within each committee, the number of actively participating delegations is typically small (20-40 for specialized committees), and positions are predictable from each country's agricultural trade interests and regulatory capacity. The US, EU, China, and Codex host countries (various) consistently drive outcomes.

For modelling purposes, the most tractable units are the specialized committees rather than the full Commission. In committees like the Codex Committee on Pesticide Residues (CCPR), decisions on maximum residue limits (MRLs) are quantitative, the scientific basis is published by JMPR, and member positions correlate with their agricultural export profiles. This combination of quantitative outcomes and economically predictable positions makes Codex committees among the most modelable decision-making bodies in any domain.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Global Health / Trade Standards]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Rigid procedure and quantitative outcomes aid modelling, but the large membership and multiple parallel committees increase complexity.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Codex standards are referenced by WTO as the benchmark for trade disputes, giving them real trade-law consequences.]],
)

#text(weight: "semibold")[Key Considerations:]

- The 8-step process means standards take years to develop, requiring long-horizon simulation
- WTO SPS Agreement references to Codex standards give them indirect legal force
- Scientific risk assessment (via JECFA, JMPR) provides a technical baseline that constrains political negotiation
- Active participation in specialized committees is much smaller than total membership

#text(weight: "semibold")[Next Steps:] Focus initial modelling on a single specialized committee (CCPR recommended); map member MRL positions against agricultural trade data; model the 8-step pipeline as a staged decision process with dropout probabilities at each stage.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== International Seabed Authority (ISA) Council

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 36-member council governing deep-sea mining with a unique chamber-based voting system designed to balance different interest groups.

The ISA Council has 36 members elected from four defined \"chambers\" representing different interest groups: major mineral consumers (Group A, 4 seats), major mineral investors (Group B, 4 seats), major mineral exporters (Group C, 4 seats), and developing states (Group D, 18 seats), plus 6 seats allocated to ensure equitable geographic representation. Substantive decisions require a two-thirds majority, and some decisions require no chamber being unanimously opposed.

This chamber-based structure is modelling gold. Each chamber represents a defined interest group with economically quantifiable preferences regarding deep-sea mining regulation -- stringency of environmental standards, royalty rates, technology transfer requirements, and the Enterprise (ISA's mining arm) provisions. The positions are predictable: mineral consumers want access and low costs, mineral exporters want protections against price competition from seabed minerals, investors want regulatory certainty, and developing states want revenue sharing and technology transfer.

The ISA is currently negotiating the Mining Code, its most consequential regulatory framework. This ongoing negotiation provides a live prediction target with clear, observable outcome variables (royalty rates, environmental standards, liability provisions). The chamber-based supermajority requirements create a tractable coalition mathematics problem.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Maritime Law / Resource Governance]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Well-defined chamber structure and economic interests, but the body is relatively new to high-stakes decisions and historical data is limited.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Potentially high if deep-sea mining becomes commercially viable; currently more regulatory-framework than operational.]],
)

#text(weight: "semibold")[Key Considerations:]

- The Mining Code negotiations are the first major test of the chamber voting system for contentious issues
- Environmental concerns from civil society and some states may transcend the chamber-interest framework
- The relationship between ISA decisions and UNCLOS provisions creates legal constraints
- China's deep-sea mining ambitions make it a key player whose position affects modelling outcomes

#text(weight: "semibold")[Next Steps:] Map each chamber member's economic interest profile (mineral imports/exports, seabed contract holdings); model Mining Code negotiation as a multi-dimensional bargaining problem with chamber-based voting constraints; simulate royalty rate outcomes under different environmental-stringency scenarios.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Wassenaar Arrangement Plenary

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 42-member conventional arms and dual-use technology export control regime with consensus decision-making and semi-annual review of controlled items lists.

The Wassenaar Arrangement is a multilateral export control regime for conventional arms and dual-use goods and technologies. Its 42 participating states meet in plenary to review and update the control lists (Munitions List, Dual-Use Goods and Technologies List, and Sensitive/Very Sensitive sub-lists) and exchange information on transfers and denials. All decisions require consensus.

The Arrangement's modelling value lies in its semi-annual control list review process. When a member proposes adding or removing items from the lists, each participating state's position can be predicted from its defense industrial base, technology sector, and trade relationships. States with major defense exports (US, France, UK, Germany) may resist controls that disadvantage their exporters, while states facing specific security threats may push for tighter controls on technologies relevant to those threats.

The list-review process is technically specific -- proposals identify particular items by technical specifications -- which means each decision has a well-defined scope. Historical list changes provide calibration data, and the technical nature of proposals limits the space of reasonable positions each state can take based on its technology profile.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Arms Control / Export Controls]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Technically defined decisions and consensus process are modelable, but deliberations are confidential.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - Control list changes affect global technology trade, particularly in cybersecurity tools, electronics, and defense systems.]],
)

#text(weight: "semibold")[Key Considerations:]

- Deliberations are confidential with limited public records
- Russia's participation has been contentious and may affect regime functioning
- Cyber-surveillance tools have become a flashpoint where human rights concerns intersect with export control
- The consensus requirement means single-state blocking can prevent list updates

#text(weight: "semibold")[Next Steps:] Map each member's defense industrial base and technology export portfolio; identify historical list-change proposals and outcomes from open-source reporting; model consensus dynamics as a function of the most-reluctant member's technology trade interests.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Board of Governors of the Federal Reserve System

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] A 7-member board (plus 5 rotating regional Fed presidents on the FOMC) making interest rate decisions through a structured deliberative process with published meeting transcripts, dot plots, and dissent records.

While not a geopolitical forum in the traditional sense, the Federal Open Market Committee (FOMC) -- comprising 7 Fed Governors and 5 of 12 regional Federal Reserve Bank presidents -- is one of the most consequential and modelable deliberative bodies in the world. It sets US interest rates through a vote at each meeting, with dissents publicly recorded and explained in meeting minutes.

The FOMC's exceptional modelability stems from the unprecedented transparency of its deliberative process. Meeting transcripts are published (with a 5-year delay), minutes are published within weeks, individual member projections (the \"dot plot\") are published quarterly, and speeches and congressional testimony provide continuous signals about each member's policy leanings. Each member can be placed on a hawk-dove spectrum using their public statements, and this calibration can be validated against their actual votes.

The decision space is low-dimensional (raise, hold, or cut the federal funds rate, typically in 25bp increments) and the key input variables (inflation, unemployment, GDP growth, financial conditions) are quantitatively measured and published. This makes the FOMC perhaps the single most tractable deliberative body for AI-agent simulation, where each agent's reaction function can be econometrically estimated.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Monetary Policy / Economic Governance]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Published transcripts, dot plots, dissent records, quantitative decision space, econometrically estimable reaction functions.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - FOMC decisions move global financial markets and set the benchmark for the world's reserve currency.]],
)

#text(weight: "semibold")[Key Considerations:]

- The Chair's consensus-building power means the vote often understates disagreement
- Forward guidance and communication policy are as consequential as rate decisions
- Balance sheet policy (quantitative easing/tightening) adds a dimension beyond rate-setting
- Political pressure on the Fed, while nominally excluded, influences the operating environment

#text(weight: "semibold")[Next Steps:] Build individual member hawk-dove profiles from speeches and dot plot submissions; estimate Taylor-rule-style reaction functions for each member; simulate rate decisions under different macroeconomic scenarios.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Bank for International Settlements (BIS) Global Economy Meeting

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] An informal gathering of approximately 30 central bank governors that shapes global monetary policy coordination through structured but confidential discussions.

The BIS Global Economy Meeting brings together roughly 30 central bank governors from the world's most systemically important economies on a bimonthly basis. While it makes no formal decisions, it serves as the premier coordination mechanism for global monetary policy. The meeting's significance lies in the informal consensus that emerges and subsequently influences individual central bank decisions.

Despite its informality, this body is modelable because central bank policy positions are among the most transparent and data-rich in all of governance. Each participating central bank publishes policy rates, inflation targets, forward guidance, and detailed monetary policy reports. The governors' individual policy orientations are observable through their domestic policy actions and public communications. The BIS itself publishes extensive research that frames the discussions.

The modelling challenge and opportunity is to simulate how the coordination mechanism works: when Governor A signals a policy shift at the BIS meeting, how does this influence Governor B's subsequent domestic policy decision? This network-influence model is more complex than simple voting simulation but potentially more predictive of real-world outcomes because it captures the transmission mechanism of international monetary policy coordination.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Monetary Policy / Central Bank Coordination]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Individual central bank positions are transparent, but the meeting itself is confidential and produces no formal outputs.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - The informal coordination influences monetary policy globally, affecting exchange rates, capital flows, and financial stability.]],
)

#text(weight: "semibold")[Key Considerations:]

- No formal decisions or published outputs make validation difficult
- The influence mechanism (informal consensus shaping subsequent national decisions) is inherently hard to observe
- Membership is informal and the meeting is invitation-only, creating boundary uncertainty
- The relationship between BIS meeting discussions and subsequent domestic policy changes is the key causal question

#text(weight: "semibold")[Next Steps:] Map each participating central bank's policy stance using published data; model the bimonthly meeting cycle as an information-exchange node in a network model; test whether post-meeting domestic policy shifts show coordination patterns beyond what bilateral channels would explain.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== Intergovernmental Panel on Climate Change (IPCC) Approval Plenaries

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Line-by-line government approval sessions for Summary for Policymakers documents, where 195 countries negotiate exact wording through consensus under rigid procedural rules.

The IPCC's most modelable decision point is the approval plenary for each Summary for Policymakers (SPM). In these sessions, government delegates negotiate the exact wording of each line of the SPM text, which must be approved by consensus. The underlying scientific report is accepted (not changed) by governments, but the SPM -- the document actually read by policymakers -- is negotiated word by word.

This process is remarkably tractable for simulation because the base text is provided by the scientific authors, and government interventions are constrained by a rule requiring consistency with the underlying report. This means the negotiation space is bounded: governments can soften language, add caveats, request deletions, or propose alternative formulations, but they cannot introduce claims unsupported by the scientific assessment. The positions of key blocs (oil producers seeking to soften urgency language, small island states seeking to strengthen it, major emitters seeking flexibility language) are stable and well-documented across multiple assessment cycles.

Published accounts of past approval sessions (AR5, AR6) by observers and participants provide detailed data on which delegations intervened on which paragraphs and what changes were made. The procedural constraint (consistency with underlying science) dramatically narrows the outcome space compared to unconstrained political negotiations.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: Climate Governance / Science-Policy Interface]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#e65100"))[Medium - Procedural constraints and stable bloc positions aid modelling, but line-by-line negotiation of text creates a high-dimensional decision space.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#2e7d32"))[High - SPM language shapes global climate policy discourse and is referenced in UNFCCC negotiations and national policy documents.]],
)

#text(weight: "semibold")[Key Considerations:]

- The \"consistency with underlying report\" constraint is interpreted by IPCC bureau members, introducing subjective judgment
- Marathon negotiating sessions (sometimes extending over multiple days) involve fatigue effects and package deals
- The next major approval plenary (AR7) provides a future prediction target
- The role of IPCC co-chairs in managing the process introduces a facilitator variable

#text(weight: "semibold")[Next Steps:] Analyze AR6 SPM approval session records to identify intervention patterns by delegation and topic; map bloc positions (OPEC, AOSIS, EU, Umbrella Group) onto a language-strength spectrum; simulate SPM wording outcomes by modelling government interventions as constrained modifications to author-drafted text.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

== International Criminal Court (ICC) Pre-Trial Chambers

#text(weight: "semibold", fill: rgb("#37474f"))[Summary:] Three-judge panels making discrete legal decisions (arrest warrants, confirmation of charges) with individually published opinions and a structured evidentiary standard.

The ICC's Pre-Trial Chambers consist of three-judge panels drawn from the Court's 18 elected judges. They make binary decisions (issue/deny arrest warrants, confirm/decline charges) based on defined evidentiary standards (\"reasonable grounds to believe\" for warrants, \"sufficient evidence to establish substantial grounds\" for charge confirmation). Each judge's vote is recorded, and dissenting opinions are published.

The chamber's modelability comes from the small panel size (3 judges), binary decision outcomes, defined legal standards, and the individual transparency of judicial reasoning. With only 18 judges total and a known assignment process, the composition of any chamber can be predicted, and each judge's legal philosophy can be profiled from their prior decisions and published opinions.

The Prosecutor's applications provide the input data -- the evidence and legal arguments that define each decision's parameters. The Pre-Trial Chamber's role is to evaluate whether the Prosecutor's evidence meets the defined threshold, creating a structured assessment task that can be modelled as a signal-detection problem: given the evidence strength and each judge's threshold calibration, predict the panel decision.

#text(size: 9.5pt, fill: rgb("#546e7a"))[Category: International Criminal Law / Judicial Body]

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [#text(weight: "semibold")[Feasibility:] #text(fill: rgb("#2e7d32"))[High - Small panels, binary outcomes, published individual opinions, defined evidentiary standards, and profileable judges.]],
  [#text(weight: "semibold")[Impact:] #text(fill: rgb("#e65100"))[Medium - ICC warrant and charging decisions have major political consequences but limited enforcement capacity.]],
)

#text(weight: "semibold")[Key Considerations:]

- Political context (e.g., warrants for sitting heads of state) may influence judicial reasoning in ways that deviate from strict legal analysis
- The small number of decisions (a few per year) limits statistical calibration
- Judge assignment to chambers may not be fully random, introducing selection effects
- The Prosecutor's discretion in which cases to bring shapes the universe of decisions the chamber faces

#text(weight: "semibold")[Next Steps:] Build judge profiles from all published ICC Pre-Trial decisions and opinions; calibrate evidence-threshold models using historical warrant applications and outcomes; simulate pending cases based on Prosecutor filings and assigned judge profiles.

#line(length: 100%, stroke: 0.5pt + rgb("#e0e0e0"))

