select orderid, sum(amount) as total_amount
from raw.stripe.payment
group by orderid
order by orderid
