# 8x8-Dadda-Multiplier

Dadda Multipliers :
1. Generate all  partial products .
2.  partial products bits with the same weight and reduce them in several layers of full and half adders till 
   each weight has no more than two wires. 
3. For all two wires, Add these two numbers using a conventional adder of appropriate size.
 
Dadda multipliers reduce as late as possible. 
* Dadda multipliers have a less expensive reduction phase, but the numbers may be a few bits longer, thus requiring slightly bigger adders.
➢ Dadda multipliers plan on reducing the final number of wires for any weight to 2 with as few and as small adders 
as possible.
➢ We determine the number of layers required first, beginning from the last layer, where no more than 2 wires . We work back from the final adder to earlier layers .
