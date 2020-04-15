class Mapa

    attr_accessor :m,:x,:y,:type

    def initialize(width,height) 
        @m=Array.new(height) {Array.new(width) {0}}
        @x=Array.new
        @y=Array.new
        @type=Array.new
        newfruit(width,height,-1)
        newfruit(width,height,-1)
        newfruit(width,height,-1)
    end

    def newfruit (width,height,i)
        if @x!=nil && i!=-1
            @x.delete_at(i)
            @y.delete_at(i)
            @type.delete_at(i)
        end
        x=rand(width)
        y=rand(height)
        @x.push(x)
        @y.push(y)
        @type.push(rand(5))
    end

    def fruit?(pos)
        @x.each_with_index do |x,i|
            if x==pos[0] && @y[i]==pos[1]
                return i
            end
        end
        return -1  
    end  
end
