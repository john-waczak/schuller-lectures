#import "../template.typ": *
#show: thmrules

= Axiomatic Set Theory

== Propositional Logic

The key notion of _propositional logic_ is a proposition.

#definition[
  A _proposition_ $p$ is a variable that can take the values "true" or "false" and no others.
]

We can build new propositions from given ones using _logical operators_.
+ _unary_ operators

  #three-line-table[
    | $p$ | $not p$ | $id p$ | $tack.b p$ | $tack.t p$ |
    | --- | ------- | ------ | ---------- | ---------- |
    |  T  |    F    |   T    |      T     |      F     |
    |  F  |    T    |   F    |      T     |      F     |
  ]

+ _binary_ operators ($2^4 = 16$ possible operators)

  #three-line-table[
    | $p$ | $q$ | $p and q$ | $p or q$ | ... | $p arrow.r.double q$ | $p arrow.l.r.double q$ |
    | --- | --- | --------- | -------- | --- | ---------------------| ---------------------- |
    |  T  |  T  |      T    |    T     | ... |        T             |           T            |
    |  T  |  F  |      F    |    T     | ... |        F             |           F            |
    |  F  |  T  |      F    |    T     | ... |        T             |           F            |
    |  F  |  F  |      F    |    F     | ... |        T             |           T            |
  ]

  The principal that anything can be implied (#sym.arrow.r.double) goes by the latin _ex falso quod libet_.

#theorem[
  $ (p arrow.r.double q) arrow.l.r.double ((not q) arrow.r.double (not p)) $
]
#corollary[
  We can prove assertions by way of contradiction.
]
#proof[
  Consider the following truth table:
  #align(center)[
    #three-line-table[
      | $p$ | $q$ | $not p$ | $not q$ | $p arrow.r.double q$ | $(not q) arrow.r.double (not p)$ |
      | --- | --- | ------- | ------- | --------------------- | -------------------------------- |
      |  T  |  T  |    F    |    F    |            T          |               T                  |
      |  T  |  F  |    F    |    T    |            F          |               F                  |
      |  F  |  T  |    T    |    F    |            T          |               T                  |
      |  F  |  F  |    T    |    T    |            T          |               T                  |
    ]
  ]
  The result follows by taking (#sym.arrow.l.r.double) of final two columns.
]

*NOTE*: We will agree on the following order for binding strength: $not, and, or, arrow.r.double, arrow.l.r.double$

*NOTE*: All operators can be constructed from "nand" ($not and$).

== Predicate Logic

#definition[
  A _predicate_ is a proposition-valued function of some variable(s)
]
#example[ $P(x)$ is "True" or "False" dependent on $x$. ]

Strictly speaking, it is not the task of predicate logic to construct the predicates. We need some further "language" for how to describe $x$ (what "set" do you take $x$ from?). We can leave it open for now so that we can define the notion of set later. It will be the task of _Set Theory_ to define some fundamental predicates, for example $Q(x, y) := x in y$

Like with propositional logic, we can construct new predicates from given ones.
+ $Q(x, y, z) :arrow.l.r.double P(x) and R(y, z)$
+ Convert predicate $P(x)$ into a proposition $forall x: P(x)$ which reads as "for all $x$, $P(x)$ is true", i.e., $P(x) arrow.l.r.double "True"$ independently of $x$.
  #example("feel-good")[
    Given
    $
      P(x) :arrow.l.r.double (x "is a human being " arrow.r.double x "has been created"),
    $
    then $forall x: P(x)$ is true.
  ]
+ Existence quantification: $exists x : P(x)$ which reads as "there exists $x$ such that $P(x)$ is true", i.e. $not (forall x: (not P(x)))$

We can chain multiple quantifiers together for predicates of multiple variables, .e.g., $forall x: exists y: P(x,y)$

== Axiomatic Systems and Theory of Proofs

What actually is a _proof_? It's a way of arguing that something is true, but we want to be more rigorous about it.

#definition[
  An _axiomatic system_ is a finite sequence of propositions $a_1, a_2, ..., a_n$ which are called _axioms_.
]

One could object that we don't have numbers yet, but we could replace these symbols with $a_i, a_(i i), a_(i i i),$ etc. These are are considered to be _pre-mathematical numbers_ by logicians. A professional logician would probably be more rigorous when publishing a new monograph...

#definition[
  A _proof_ of a proposition $p$ within an axiomatic system $a_1, ..., a_n$ is a finite sequence of propositions $q_1, ..., q_m$ (with $q_m arrow.l.r.double p$) such that for any $1 lt.eq j lt.eq m$ either
  + *(Axiomatic)* $q_j$ is a proposition from the list of axioms
  + *(Tautological)* $q_j$ is a tautology (statements that are true no matter what e.g., $p or not p$)
  + *(Modus ponens)* $exists (1 lt.eq r,s lt j): q_r and q_s arrow.r.double q_j$ is true
]<proof-def>
Most theorems are not proven in this fashion because it takes _many_ lines to take this fully rigorous approach. This is like the machine code for proofs. We will use a more relaxed approach that is like the c++ of proofs, with the understanding being that a proof is only valid if other mathematicians agree that, _in principal_, what was written can be decomposed into proofs of this type.

#def_remark[
  If $p$ can be proven from an axiomatic system $a_1, ..., a_n$, we often write $a_1, ..., a_n tack.r p$
]

#def_remark[
  This definition allows us to easily check a proof. An altogether different task is to _find_ a proof.
]

#def_remark[
  Any tautology that occurs within the axioms of an axiomatic system can be removed without impairing the power of the axiomatic system. As an extreme example: the axiomatic system that describes propositional logic is the empty sequence because all we can prove are tautologies.
]

#definition[
  An axiomatic system is _consistent_ if there exists a proposition $q$ which _cannot_ be proven from the axioms.
]<consistent>

The idea behind @consistent is that a set of axioms for which anything can be proven is _useless_. Consider an axiomatic system containing contradictory propositions: $..., s, ..., not s, ...$. Then, by @proof-def, $s and not s arrow.r.double q$ is a tautology. Any statement could be proven to be true.

#theorem[
  Propositional logic is consistent.
]
#proof[
  It suffices to show that there exists a proposition that can not be proven within propositional logic. Propositional logic has an empty sequence of axioms. The only rules for proofs are (T) and (M) from @proof-def. Therefore, only tautologies can be proven. $q and not q$  can not be proven since it is not a tautology.
]

In general, it's very hard to prove a set of axioms are consistent.
#theorem("Gödel")[
  Any axiomatic system that is _powerful enough_ to encode the elementary arithmetic of natural numbers is either inconsistent or contains a proposition that can neither be proven nor disproven.
]

This sent shockwaves through the mathematics world at the time (20th century) because the notion of truth had seemed to be clear: something was true _if it could be proven_. Gödel's theorem shows there are true statements that can't be proven!

#proof[
  Basic idea:
  + Assign to each (meta-)mathematical statement a number (called the Gödel nubmer)
  + Use a "The barber shaves all people in his village who do not shave themselves"-type argument to identify a proposition that is neither provable nor disprovable.
]
