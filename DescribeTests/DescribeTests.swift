import Quick
import Nimble
import Describe

class DescribeTests: QuickSpec {

    override func spec() {

        describe("#describe") {

            it("should return an instance of the given class") {
                expect(describe(UILabel.self)).to(beAnInstanceOf(UILabel))
            }

            it("should call the given closure with the created instance") {
                var closureInstance: UIView? = nil
                let returnedInstance = describe(UILabel.self) { view in
                    closureInstance = view
                }
                expect(closureInstance).to(equal(returnedInstance))
            }

        }

        describe("UIView") {

            describe("#describeSubview") {

                var parentView: UIView!

                beforeEach {
                    parentView = UIView()
                }

                it("should return an instance of the given class") {
                    expect(parentView.describeSubview(UILabel.self)).to(beAnInstanceOf(UILabel))
                }

                it("should call the given closure with the created instance") {
                    var closureInstance: UIView? = nil
                    let returnedInstance = parentView.describeSubview(UILabel.self) { view in
                        closureInstance = view
                    }
                    expect(closureInstance).to(equal(returnedInstance))
                }

                it("should add the view as subview before calling the closure") {
                    parentView.describeSubview(UILabel.self) { view in
                        expect(parentView.subviews).to(contain(view))
                    }
                }

            }

        }

    }

}
