class Semimatch < ApplicationRecord
    
    def create ()
    #Check if other match, unmatch or semimatch exists

    User.where(id: t.person2_id)

        if(Semimatch.exists?(person1_id: id) ||
        Semimatch.exists?(person2_id: id) ||
        Match.exists?(person2_id: id) ||
        Match.exists?(person1_id: id) ||
        Unmatch.exists?(person1_id: id) ||
        Unmatch.exists?(person1_id: id)
        )
        return false
        end
    
    #There is a match!
    if(Semimatch.exists?(person1_id: id))
        Match.create()
    end
    
    
    end
    
end
