# What I Learnt : 

- I was making the mistake of updating the state of the all the elements rather than updating state based on clicks. (bad decision : unsynchronized state)==

- Made the mistake of not using pads to be mapped over, earlier it wasn't detecting any changes because it wasn't the state's data which was
  being updated.

-  So what's happeing here is that the prev value of the `pads` is being mapped over.
   and i've set the condition that if the id of the prevVal.id matches the id which is being passed over
   then edit the current object and pass it with the opposite value of prevVal.on or else if it doesn't
   match then just pass the value of the previous object(meaning without any changes to that object)
