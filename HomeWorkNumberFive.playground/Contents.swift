import UIKit

/* Необходимо создать сущность (либо структура, либо класс):
 Линия, принимает две точки в качестве инициализатора. Имеет свойство — длина. */

struct Line {
    var x: Double
    var y: Double
}

struct Lenght {
    var start: Line
    var end: Line
    
    
    var lenghtLine: Double {
        let distanceX = end.x - start.x
        let distanceY = end.y - start.y
        let degree: Double = 2
        return sqrt(pow(distanceX, degree) + pow(distanceY, degree))
    }
}

let myLine = Lenght(start: Line(x: 10, y: 10), end: Line(x: 5, y: 10))
print(myLine.lenghtLine)

/* Необходимо создать сущность (либо структура, либо класс):
 Круг, в качестве инициализатора принимает точку и радиус. Имеет свойства — длина окружности, площадь круга, диаметр. */

struct Point {
    var x: Double
    var y: Double
}

class Figure {
    let position: Point
    
    init(position: Point) {
        self.position = position
    }
    
    init(x: Double, y: Double){
        position = Point(x: x, y: y)
    }
    func printInfo() {
        print(position)
    }
}

final class Circle: Figure {
    let radius: Double
    
    init(point: Point, radius: Double) {
        self.radius = radius
        super.init(position: point)
        
    }
    var circumference: Double {
        return 2 * .pi * radius
    }
    
    var area: Double {
        return  radius * .pi * radius
    }
    
    var diameter: Double {
        return 2 * radius
    }
}

let figure = Figure(position: Point(x: 15, y: 35))
figure.printInfo()
let circle = Circle(point: Point(x: 10, y: 5), radius: 15)
circle.printInfo()
print(circle.circumference)
print(circle.area)
print(circle.diameter)

/* Необходимо создать сущность (либо структура, либо класс):
 Многоугольник, в качестве инициализатора принимает массив точек. Имеет свойство — периметр многоугольника. */

struct Points {
    var x: Double
    var y: Double
}

struct Polygon {
    var points: [Points]
    
    init(points: [Points]) {
        self.points = points
    }
    
    func distance(from point1: Points, to point2: Points) -> Double {
        let deltaX = point2.x - point1.x
        let deltaY = point2.y - point1.y
        return (deltaX * deltaX + deltaY * deltaY).squareRoot()
    }
    
    var perimeter: Double {
        var perimeter = 0.0
        if points.count < 2 {
            return perimeter
        }
        
        for i in 0..<points.count - 1 {
            perimeter += distance(from: points[i], to: points[i + 1])
        }
        
        perimeter += distance(from: points.last!, to: points.first!)
        return perimeter
    }
}

let polygonPoints = [
    Points(x: 0, y: 0),
    Points(x: 3, y: 0),
    Points(x: 3, y: 4),
    Points(x: 0, y: 4)
]

let polygon = Polygon(points: polygonPoints)
print("Perimeter of the polygon: \(polygon.perimeter)")
