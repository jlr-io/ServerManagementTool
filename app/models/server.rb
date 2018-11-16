class Server < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
    belongs_to :user
  
=======
  belongs_to :user

>>>>>>> 7a640f85ef6aa972181687cbfbc430f95c163094
=======
  belongs_to :user

>>>>>>> 7a640f85ef6aa972181687cbfbc430f95c163094
   scope :approved, ->{
        where(:approved => true)
   }
   scope :pending, ->{
        where(:approved=> false)
   }
end
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 7a640f85ef6aa972181687cbfbc430f95c163094
=======
>>>>>>> 7a640f85ef6aa972181687cbfbc430f95c163094
