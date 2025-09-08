#import "../template.typ": *
#show: thmrules

== The #sym.in - Relation

Set theory is build on the postulate that there is a fundamental relation, i.e., a predicate of two variables, called #sym.in. There will be *no* (strict) definition of what #sym.in is, or of what a set is. Instead, we will write down 9 axioms that speak of #sym.in and sets. These axioms will teach us how to use #sym.in and what constitutes a set. Such an approach is necessary if we want to start _from scratch_ without any other prior, assumed notions.

Using the #sym.in - relation, we can immediately define:
$
     x in.not y & :arrow.l.r.double not(x in y) \
  x subset.eq y & :arrow.l.r.double forall a: (a in x arrow.r.double x in y) \
          x = y & :arrow.l.r.double x subset.eq y and y subset.eq x
$

== Zermelo-Frankel Axioms of Set Theory

Commonly, these are referred to as ZFC for #strong[Z]ermelo-#strong[F]rankel with the Axiom of #strong[C]hoice.

#axiom("Existance of sets")[
  The statement $x in y$ is a proposition if and only if $x$ and $y$ are both sets, i.e., $forall x: forall y: (x in y) overline(or) not(x in y)$ (where $overline(or)$ is exclusive or).

  _NOTE_: there's some disagreement online about his treatment #link("https://math.stackexchange.com/questions/3508309/is-the-axiom-on-in-relation-equivalent-to-the-axiom-of-extensionality")[here]. I suspect Schuller is just using an alternative formulation since we define "=" in terms of #sym.in
]

#axiom("Existance of empty set")[
  There exists a set that contains no elements, i.e., $exists x: forall y: y in.not x$
]

#theorem[
  The empty set is unique, and we give it the label #sym.emptyset.
]
#proof("(Standard textbook style)")[
  Assume $x$ and $x'$ are both empty sets. But then $forall y: (y in x) arrow.r.double (y in x')$. This means that $x subset.eq x'$. Conversly, $forall z: (z in x') arrow.r.double (z in x)$. Thus, $x' subset.eq x$. Therefore, $x = x'$.
]
#proof("(formal version)")[
  $
    a_1 & arrow.l.r.double forall y: y in.not x \
    a_2 & arrow.l.r.double forall y: y in.not x' \
    q_1 & arrow.l.r.double (forall y: y in.not x) arrow.r.double (forall y : (y in x arrow.r.double y in x'))\
    q_2 & arrow.l.r.double a_1 \
    q_3 & arrow.l.r.double (forall y : (y in x arrow.r.double y in x')) arrow.l.r.double x subset.eq x' \
    q_4 & arrow.l.r.double (forall y: y in.not x') arrow.r.double (forall y : (y in x' arrow.r.double y in x))\
    q_5 & arrow.l.r.double a_2 \
    q_6 & arrow.l.r.double (forall y : (y in x' arrow.r.double y in x)) arrow.l.r.double x' subset.eq x \
    q_7 & arrow.l.r.double x = x' \
  $
  Therefore, the two empty sets are equivalent.
]
Going forward, we will not use this formal proof technique. In principal, we must be able to break down each proof to this level, if prodded.

#axiom("Pair sets")[
  Let $x$ and $y$ be sets. Then there exists a set that contains as its elements precisely the sets $x$ and $y$, i.e., $forall x: forall y: exists m: forall u: (u in m) arrow.l.r.double (u = x or u = y)$. The usual notation is to denote the set $m$ by ${x, y}$
]
It appreas we have introduced an order here. Is ${x, y}$ the same as ${y, x}$? *Answer*: Yes, because $(a in {x y}) arrow.l.r.double (a in {y, x})$

#axiom("Union sets")[
  Let $x$ be a set. Then there exists a set $u$ whose elements are precisely the elements of the elements of $x$.

  Notation: $u = union.big x$
]

#example[
  Let $a, b, c$ be sets. Then ${a}$ and ${b}$ are sets and $x = {{a}, {b}} arrow.r.double union.big x = {a, b}$ is a set.
]

#example[
  Let $x = {{a}, {b,c}}$ a set. Then it follows that $union.big x$ is a set which is defined to be $union.big x := {a, b, c}$.
]

#definition[
  Let $a_1, a_2, ..., a_n$ be sets. Define recursively for $n gt.eq 3$ the symbol ${a_1, ..., a_n} := union.big {{a_1, ..., a_(n-1)}, {a_n}}$, i.e., we recursively apply the pair set axiom.
]

#axiom("Replacemnt")[
  Let $R$ be a _functional_ relation. Let $m$ be a set. Then the _image_ of $m$ under $R$ is again a set.

  Here:
  - A relation $R$ is called _functional_ if $forall x: exists ! y: R(x,y)$, i.e. each $x$ must be mapped to some $y$.
  - The _image_ of a set $m$ under a functional relation $R$ consists of those $y$ for which there is an $x in m$ such that $R(x,y)$
]<axiom_replacement>

Axiom @axiom_replacement implies an additional principle called _the principle of restricted comprehensions_ which states that for a predicate $P$ of one variable and a set $m$, the elements $y in m$ for which $P(y)$ is true constitute a set, denoted ${y in m bar.v P(y)}$. This is our familiar "set builder" notation.

The principal of restricted comprehension is *not* to be confused with the _inconsistent_ principal of universal comprehension which allowed us to write ${y bar.v P(y)}$. This leads to problems like Russel's paradox. We must identify the set $m$ from which $y$ come!

#definition[
  Let $u subset.eq m$, then $m backslash u := {x in m bar.v x in.not u}$
]

Now we move on to discuss the notion of _power sets_. Historically, in naive set theory, the principle of universal comprehension (PUC) was thought to be needed in order to define

$ cal(P)(m) := {y bar.v y subset.eq m} $

Then, the rest of set theory would be created by repeated application of the power set. However, we cant write this definition without PUC. Instead, we postulate that the power set exists...

#axiom("Existence of power sets")[
  Let $m$ be a set. Then there exists a set, denoted $cal(P)(m)$, whose elements are precisely the subsets of $m$.
]

#example[
  Let $m={a,b}$, then $cal(P)(m) = {emptyset, {a}, {b}, {a,b}}$.
]

#axiom("Infinity")[
  There exists a set that contains the empty set and, with each of its elements $y$, it also contains as an element ${y}$.
]

One such set is, informally thinking, the set with the elements $emptyset, {emptyset}, {{emptyset}}, {{{emptyset}}},...$

In "elementary school", we introduce a "trivial" notation:
- $emptyset := 0$
- ${emptyset} := 1$
- ${{emptyset}} := 2$
- ${{{emptyset}}} := 3$
- and so on...

#corollary[
  The set of non-negative integers, $bb(N)$, is a set.
]

As a _set_, $bb(R)$ can be understood/defined as $bb(R) := cal(P)(bb(N))$. All of the sets that we are familiar with will be boostrapped from the empty set in this fashion.

#axiom("Axiom of Choice")[
  Let $x$ be a set whose elements are
  - non-empty
  - mutually disjoint
  Then, there exists a set $y$ which contains exactly one element of each element of $x$.
]<axiom-of-choice>

Sometimes people call $y$ a _dark set_ since it's not clear _how_ to pick the element from each element of $x$. The intuition is:

$x = {{text("left shoe 1"), text("right shoe 1")}, {text("left shoe 2"), text("right shoe 2")}, ...}$
$y = {text("left shoe 1"), text("left shoe 2"), ...}$

does not need the axiom of choice. But, if instead, we were to consider sets of socks:

$x = {{text("sock 1 left"), text("sock 1 right")}, {text("sock 2 left"), text("sock 2 right")}...}$

but left/right socks look the same, so we need to invoke @axiom-of-choice to construct $y$.

Another observation is that @axiom-of-choice is _independent_ of the other 8 axioms so that we could have a set theory with it omitted.

Finally, we note that
- the proof that every vector space has a basis requires the axiom of choice.
- the proof that there exists a complete system of representatives of an equivalence relation requires the axiom of choice.

#axiom("Axiom of Foundation")[
  Every non-empty set $x$ contains an element $y$ such that $x$ and $y$ are disjoint sets.
]

An immediate implication is that there is _no_ set that contains itself as an element.
