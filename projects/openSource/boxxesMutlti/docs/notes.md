We are ultimatley paying out to users. 

2 Ways to do this.

1. Users should be paid through their stripe and pay a monthly fee for bandwith/storage used.         
2. We accept all payments through our stripe and then calcualte the fees and payout.  

The second is not really a model suited to this. And I I think the fees on individuals transactions is a little shitty anyway. Anyways thats another app altogether.

So we need someway for a user to payed, i.e the charge occurs on their account not ours. This requires adding some sort of flexibility to the stripe calls. We need to on the fly change the stripe API key to theirs. IS this an apporpiate way to use the API?  Slight risk of the stripe API Key var becoming corrupted, i.e point to someone else's.