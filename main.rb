require_relative "snake"
require_relative "mapa"
require 'ruby2d'

print "Escolha a width do mapa: "
width=gets.chomp.to_i
print "\nEscolha a height do mapa: "
height=gets.chomp.to_i

mapa=Mapa.new(width,height)
snake=Snake.new(width/2,height/2)

set title: 'Snake'

on :key_down do |event|
    case event.key
    when "up"
        snake.mudaDir('C')
    when "down"
        snake.mudaDir('B')
    when "right"
        snake.mudaDir('D')
    when "left"
        snake.mudaDir('E')
    when "escape"
        close
    end
    
end
t=0
speed=5
tick=0
color=String.new
update do
    if t%300==0
        speed=5
    end
    if tick%speed==0
        clear
        Rectangle.new(
            x: 20,
            y: 20,
            width: width*8.5,
            height: height*8.5,
            color: 'black')
            mapa.x.each_with_index do |x,i|
                case mapa.type[i]
                when 0
                    color='red'
                when 1
                    color='brown'
                when 2
                    color='blue'
                when 3
                    color='white'
                when 4
                    color='yellow'
                end
                Square.new(
                    x: x*8.5+20,
                    y: mapa.y[i]*8.5+20,
                    size: 7.5,
                    color: color
                )  
            end  
        snake.pos.each do |pos|
            Square.new(
                x: pos[0]*8.5+20,
                y: pos[1]*8.5+20,
                size: 7.5,
                color: 'green'
            )
        end
        r= mapa.fruit?(snake.pos[-1])
        if r>-1
            case mapa.type[r]
            when 0
                snake.cresce()
            when 1 
                snake.minga()
            when 2
                speed/=2
            when 3
                speed*=2
            when 4
                k=4
                while k>0
                    snake.cresce()
                    k-=1
                end
            end
            t=0
            mapa.newfruit(width,height,r)
        end
        if snake.dead?(width,height)
            puts "GAME OVER"
            exit
        else
            snake.anda()
        end
    end
    tick+=1
    t+=1
end

show


