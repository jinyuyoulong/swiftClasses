import Cocoa

typealias Distance = Double

struct Position {
    var x:Double
    var y:Double
}

struct ship {
    var position:Position
    var firingRang:Distance
    var unsafeRange:Distance
}

extension Position {
    // z*z = x*x + y*y
    func inRange(range:Distance) -> Bool {
        return sqrt(x * x + y * y) <= range
    }
}
extension Position {
    func minus(p: Position) -> Position {
        return Position(x: x-p.x, y: y-p.y)
    }
    var length: Double {
        return sqrt(x*x+y*y)
    }
}
extension ship {
    func canSafelyEngageShip(target:ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistence = sqrt(dx*dx + dy*dy)

        return targetDistence <= firingRang && targetDistence > unsafeRange
    }
}

extension ship {
    func canSafelyEngageShip1(target:ship, friendly: ship) -> Bool {
        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let targetDistence = sqrt(dx*dx + dy*dy)

        let friendlyDx = friendly.position.x - target.position.x
        let friendlyDy = friendly.position.y - target.position.y
        let friendDistence = sqrt(friendlyDx*friendlyDx + friendlyDy*friendlyDy)

        return targetDistence <= firingRang
            && targetDistence > unsafeRange
            && (friendDistence > unsafeRange)
    }
}

extension ship {
    func canSafelyEngageShip2(target:ship, friendly: ship) -> Bool {

        let targetDistence = target.position.minus(p: position).length
        let friendDistence = friendly.position.minus(p: target.position).length

        return targetDistence <= firingRang
            && targetDistence > unsafeRange
            && (friendDistence > unsafeRange)
    }
}
extension ship {
    func canSafelyEngageShip3(target:ship, friendly: ship) -> Bool {

        let rangeRegion = difference(region: circle(radius: firingRang), minus: circle(radius: unsafeRange))
        let firingRegion = shift(region: rangeRegion, offset: position)
        let friendlyRegion = shift(region: circle(radius: unsafeRange), offset: friendly.position)
        let resultRegion =  difference(region: firingRegion, minus: friendlyRegion)

        return resultRegion(target.position)
    }
}

//=========================================
// Region 类型将指代把 Position 转化为 Bool 的函数
typealias Region = (Position) -> Bool

func circle(radius: Distance) -> Region {
    return {point in point.length <= radius}
}

// 圆心不在原点上
func circle2(radius: Distance ,center: Position) -> Region {
    return {point in point.minus(p: center).length <= radius}
}

// 区域变换函数 不仅想要一个圆
func shift(region: @escaping Region, offset: Position) -> Region {
    return {point in region(point.minus(p: offset))}
}

// 反转区域
func invert(region: @escaping Region) ->Region {
    return {point in !region(point)}
}

// 交集&并集
func intersection (region1: @escaping Region, region2: @escaping Region) -> Region {
    return {point in region1(point) && region2(point)}
}

func union(region1: @escaping Region, region2: @escaping Region) -> Region {
    return {point in region1(point) || region2(point)}
}

func difference(region: @escaping Region, minus: @escaping Region) -> Region {
    return intersection(region1: region, region2: invert(region: minus))
}
