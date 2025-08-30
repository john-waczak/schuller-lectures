#import "template.typ": *
#show: thmrules
#show: notes.with(
  notes_title: "Geometric Anatomy of Theoretical Physics",
  lecture_url: "https://youtube.com/playlist?list=PLPH7f_7ZlzxTi6kS4vCmv4ZKm9u8g5yic&si=I4Z7RuaUfAN0f0sA",
  author: "John Waczak",
  date_updated: "2025-08-28",
)


#quote(
  attribution: [Wittgenstein],
)[Wherof one cannot speak, thereof one must be silent.]

#heading(level: 1, numbering: none)[Overview]

Theoretical physics is all about casting our ideas about the real world into _rigorous_ mathematical form. We don't do this for mathematic's sake, but rather to fully explore what the implications of our ideas are.

*Idea*: If we have concepts that we can't cast into rigorous mathematical form, we have a strong indication that these concepts are not well understood.

From this perspective, then, mathematics is _just_ the language. To draw physically meaningful conclusions, we must interpret the language.

*Goals*: Provide _proper_ mathematical language for
- classical mechanics
- electromagnetism
- quantum mechanics
- statistical physics
So far, we have used a lot of mathematical tools such as
- Analysis
- Algebra
- Geometry
For example, we often appeal to geometric intuition for classical mechanics and electrodynamics. _Linear_ algebra is leveraged throughout...

*Differential Geometry* can be thought of as the intersection of these three mathematical fields and is the primary subject for the course. The general structure will be to develop tools in the following sequence:
+ _Logic_ (propositional and predicate logic)
+ _Axiomatic Set theory_ (What are sets? How do we define them?)
+ _Topology_ (What is continuity?)
+ _Topological Manifolds_ (Toplogical spaces that "locally" look like $RR^d$)
+ _Differentiable Manifolds_ (So that we can discuss derivatives)
+ _Bundles_ (In order to introduce vector and tensor fields)
+ _Symplectic/Metric Geometry_
+ *PHYSICS*

#include "lectures/lecture_1.typ"
#include "lectures/lecture_2.typ"
