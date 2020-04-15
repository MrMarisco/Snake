class Snake 

    attr_accessor :pos,:dir

    def initialize(width,height)
        @pos=[[width,height],[width,height],[width,height],[width,height]]
        @dir='C'
    end

    def cresce
        @pos.unshift(@pos[0])
    end

    def minga
        @pos.delete_at(0)
    end

    def anda
        case @dir
        when 'C' 
            @pos.push([@pos[-1][0],@pos[-1][1]-1])
        when 'B' 
            @pos.push([@pos[-1][0],@pos[-1][1]+1])
        when 'D' 
            @pos.push([@pos[-1][0]+1,@pos[-1][1]])
        when 'E' 
            @pos.push([@pos[-1][0]-1,@pos[-1][1]])
        end
        @pos.delete_at(0)
    end

    def mudaDir(dir)
        @dir=dir
    end

    def dead?(width,height) 
       if @pos[-1][0]==width || @pos[-1][1]==height || @pos[-1][0]==-1 || @pos[-1][1]==-1
        return true
       end
    end
end

