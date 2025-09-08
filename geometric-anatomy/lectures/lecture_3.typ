#import "../template.typ": *
#show: thmrules

== Classification of sets

A recurrent theme in mathematics is the _classification_ of _spaces_ by means of structure-preserving _maps_ between those spaces. The _space_ is usually meant to be some set equipped with some _structure_.

#definition[
  A _map_ $phi.alt : A arrow.r B$ is a _relation_ such that $forall a in A$ there exists exactly one $b in B$ such that $phi.alt(a, b)$.

  Standard notation:
  $
    phi.alt : A & -> B \
              a & |-> phi.alt(a)
  $

  Terminology:
  - $A$ is the domain of $phi.alt$.
  - $B$ is the target of $phi.alt$.
  - $phi.alt(A) equiv text("im")_phi.alt(A) := {phi.alt(a) in B bar.v a in A}$ is the image.
]

#definition[
  Let $phi.alt: A -> B$ be a map. Then, $phi.alt$ is
  - _injective_ (one-to-one) if $phi.alt(a_1) = phi.alt(a_2) => a_1 = a_2$
  - _surjectivie_ (onto) if $phi.alt(A) = B$
  - _bijective_ if _injective_ and _surjective_.
]

#definition[
  Two sets $A$ and $B$ are called (set-theoretically) _isomorphic_, written $A tilde.equiv_text("set") B$, if there exists some bijection $phi.alt: A -> B$.
]

#def_remark[
  If there _is_ any bijection $phi.alt : A -> B$, then generically, there are many.
]

#definition[
  A set $A$ is
  - _infinite_ if there exists a proper subset $B subset A$ such that $B tilde.equiv_text("set") A$.
    - _countably infinite_ if $A tilde.equiv_text("set") bb(N)$
    - _uncountably infinite_ otherwise.
  - _finite_ otherwise
]

#definition[
  Given two maps $A ->^(phi.alt) B$ and $B ->^(psi) C$, one can construct a new map
  $
    psi circle.small phi.alt: A & -> C \
                              a & |-> psi(phi.alt(a))
  $
  called the _composition_ of maps $phi.alt$ and $psi$. When reading $psi circle.small phi.alt$, we say "$phi.alt$ after $psi$".
]

#definition[
  Let $phi.alt: A -> B$ be a bijection. Then the _inverse_ map of $phi.alt$ is the map
  $
    & phi.alt^(-1) : B -> A \
    & text("Defined uniquely by") \
    & phi.alt^(-1) circle.small phi.alt = text("id")_A \
    & phi.alt circle.small phi.alt^(-1) = text("id")_B
  $
]
