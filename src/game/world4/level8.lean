import game.world4.level7 -- hide

-- incantation for importing ring into framework -- hide
import tactic.ring -- hide
meta def less_leaky.interactive.ring := tactic.interactive.ring
namespace mynat -- hide
instance : comm_semiring mynat := begin
  structure_helper,
end

/- 

# World 4 : Power World

## Level 8 : `add_squared`

[final boss music] 

You see something written on the stone dungeon wall:
```
begin
  rw one_eq_succ_zero,
  repeat {rw pow_succ},
  ...
```

and you can't make out the rest.

[editor's note: Actual Lean natural
numbers do have `2`, but I figured now was no time to
introduce it and anyway the first thing you'd do with
it would be change it to `succ(1)` anyway]

-/

/- Theorem
For all naturals $a$ and $b$, we have
$$(a+b)^2=a^2+b^2+2ab.$$
-/
lemma add_squared (a b : mynat) :
  (a + b) ^ (succ(1)) = 
a ^ (succ(1)) + b^(succ(1)) + (succ(1))*a*b :=
begin [less_leaky]
  rw [pow_succ, pow_succ, pow_succ, one_eq_succ_zero],
  rw [pow_succ, pow_succ, pow_succ, pow_zero, pow_zero],
  rw [pow_zero, one_mul, one_mul, one_mul, mul_add],
  rw [add_mul, add_mul, succ_mul, succ_mul],
  rw [zero_mul, zero_add, add_mul, mul_comm b],
  rw add_assoc, 
  rw ←add_assoc (a * b),
  rw add_comm _ (b * b),
  rw ←add_assoc,
  rw ←add_assoc,
  refl,
end

-- now blow them away with `ring`. But I can't get it to work,
-- with or without the leaky framework :-/ 

lemma add_squared' (a b : mynat) :
  (a + b) ^ (succ(1)) = 
a ^ (succ(1)) + b^(succ(1)) + (succ(1))*a*b :=
begin [less_leaky]
  rw one_eq_succ_zero,
  repeat {rw pow_succ},
  repeat {rw pow_zero},
  ring,




end
/- 

As the boss lies smouldering, you notice that two more lines
of code are now visible under the first two.

<a href="link_to_tweet" >

I just beat this level with 27 rewrites followed by a `refl`. 
Can you do any better? If you beat it then well done. Do you
fancy doing $(a+b)^3$ now? You might want to read 
<a href="https://xenaproject.wordpress.com/2018/06/13/ab3/" target="blank">
this Xena Project blog post</a> before you start though.
-/

/-
The next world is inequality world, and you are going to have to
learn two more tactics -- `cases` and `use`. Unfortunately I can
only think of a few levels before we actually have to learn about
how Lean handles implications, which is what I am currently working on.
-/

end mynat -- hide