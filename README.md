# 8x8-Dadda-Multiplier

Dadda Multipliers :
1. Generate all bits of the partial products .
2. Collect all partial products bits with the same weight and reduce these in several layers of adders till 
   each weight has no more than two wires. 
3. For all bit positions which have two wires, take one wire at  corresponding place values to form one number, and the other wire 
      to form another number.
Add these two numbers using a conventional adder of appropriate size.
 
Dadda multipliers reduce as late as possible. 
* Dadda multipliers have a less expensive reduction phase, but the numbers may be a few bits longer, thus requiring slightly bigger adders.
➢ Dadda multipliers plan on reducing the final number of wires for any weight to 2 with as few and as small adders 
as possible.
➢ We determine the number of layers required first, beginning from the last layer, where no more than 2 wires . 

• We work back from the final adder to earlier layers .
• We know that the final adder can take no more than 2 wires for  each weight
• Maximum number of wires for any weight in layer j, where j = 1 for the final adder. ( d1 = 2). 
• The maximum number of wires which can be handled in layer  j+1 (from  end) is the integral part of 3/2dj . 
• We go up in j, till we reach a number which is just greater than or equal to the largest bunch of wires in any weight.
