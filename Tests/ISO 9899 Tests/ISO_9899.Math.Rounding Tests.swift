// ISO_9899.Math.Rounding Tests.swift
// swift-iso-9899
//
// Tests for ISO/IEC 9899 Section 7.12.9 - Rounding functions

import Testing

@testable import ISO_9899

@Suite
struct `ISO_9899.Math - Rounding Functions` {

    // MARK: - ceil() Tests

    @Suite
    struct `ceil() - Basic Functionality` {

        private static let `ceil rounds toward positive infinity arguments`: [(Double, Double)] = [
            (2.3, 3.0),
            (2.0, 2.0),
            (2.9, 3.0),
            (-2.3, -2.0),
            (-2.0, -2.0),
            (-2.9, -2.0),
            (0.1, 1.0),
            (0.9, 1.0),
            (-0.1, 0.0),
            (-0.9, 0.0),
        ]

        @Test(arguments: Self.`ceil rounds toward positive infinity arguments`)
        func `ceil rounds toward positive infinity`(input: Double, expected: Double) {
            #expect(ISO_9899.Math.ceil(input) == expected)
        }

        @Test
        func `ceil of zero returns zero`() {
            #expect(ISO_9899.Math.ceil(0.0) == 0.0)
            #expect(ISO_9899.Math.ceil(-0.0) == -0.0)
        }

        @Test
        func `ceil preserves sign of zero`() {
            let positiveZero = ISO_9899.Math.ceil(0.0)
            let negativeZero = ISO_9899.Math.ceil(-0.0)
            #expect(positiveZero.sign == .plus)
            #expect(negativeZero.sign == .minus)
        }

        @Test
        func `ceil of infinity returns infinity`() {
            #expect(ISO_9899.Math.ceil(Double.infinity) == Double.infinity)
            #expect(ISO_9899.Math.ceil(-Double.infinity) == -Double.infinity)
        }

        @Test
        func `ceil of NaN returns NaN`() {
            #expect(ISO_9899.Math.ceil(Double.nan).isNaN)
        }

        @Test
        func `ceil of integer returns same integer`() {
            #expect(ISO_9899.Math.ceil(42.0) == 42.0)
            #expect(ISO_9899.Math.ceil(-17.0) == -17.0)
        }
    }

    @Suite
    struct `ceil() - Float Variant` {

        private static let `ceilf rounds toward positive infinity arguments`: [(Float, Float)] = [
            (Float(2.3), Float(3.0)),
            (Float(2.0), Float(2.0)),
            (Float(-2.3), Float(-2.0)),
            (Float(-2.0), Float(-2.0)),
        ]

        @Test(arguments: Self.`ceilf rounds toward positive infinity arguments`)
        func `ceilf rounds toward positive infinity`(input: Float, expected: Float) {
            #expect(ISO_9899.Math.ceil(input) == expected)
        }

        @Test
        func `ceilf special values`() {
            #expect(ISO_9899.Math.ceil(Float(0.0)) == 0.0)
            #expect(ISO_9899.Math.ceil(Float.infinity) == Float.infinity)
            #expect(ISO_9899.Math.ceil(-Float.infinity) == -Float.infinity)
            #expect(ISO_9899.Math.ceil(Float.nan).isNaN)
        }
    }

    // MARK: - floor() Tests

    @Suite
    struct `floor() - Basic Functionality` {

        private static let `floor rounds toward negative infinity arguments`: [(Double, Double)] = [
            (2.3, 2.0),
            (2.0, 2.0),
            (2.9, 2.0),
            (-2.3, -3.0),
            (-2.0, -2.0),
            (-2.9, -3.0),
            (0.1, 0.0),
            (0.9, 0.0),
            (-0.1, -1.0),
            (-0.9, -1.0),
        ]

        @Test(arguments: Self.`floor rounds toward negative infinity arguments`)
        func `floor rounds toward negative infinity`(input: Double, expected: Double) {
            #expect(ISO_9899.Math.floor(input) == expected)
        }

        @Test
        func `floor of zero returns zero`() {
            #expect(ISO_9899.Math.floor(0.0) == 0.0)
            #expect(ISO_9899.Math.floor(-0.0) == -0.0)
        }

        @Test
        func `floor preserves sign of zero`() {
            let positiveZero = ISO_9899.Math.floor(0.0)
            let negativeZero = ISO_9899.Math.floor(-0.0)
            #expect(positiveZero.sign == .plus)
            #expect(negativeZero.sign == .minus)
        }

        @Test
        func `floor of infinity returns infinity`() {
            #expect(ISO_9899.Math.floor(Double.infinity) == Double.infinity)
            #expect(ISO_9899.Math.floor(-Double.infinity) == -Double.infinity)
        }

        @Test
        func `floor of NaN returns NaN`() {
            #expect(ISO_9899.Math.floor(Double.nan).isNaN)
        }

        @Test
        func `floor of integer returns same integer`() {
            #expect(ISO_9899.Math.floor(42.0) == 42.0)
            #expect(ISO_9899.Math.floor(-17.0) == -17.0)
        }
    }

    @Suite
    struct `floor() - Float Variant` {

        private static let `floorf rounds toward negative infinity arguments`: [(Float, Float)] = [
            (Float(2.3), Float(2.0)),
            (Float(2.0), Float(2.0)),
            (Float(-2.3), Float(-3.0)),
            (Float(-2.0), Float(-2.0)),
        ]

        @Test(arguments: Self.`floorf rounds toward negative infinity arguments`)
        func `floorf rounds toward negative infinity`(input: Float, expected: Float) {
            #expect(ISO_9899.Math.floor(input) == expected)
        }

        @Test
        func `floorf special values`() {
            #expect(ISO_9899.Math.floor(Float(0.0)) == 0.0)
            #expect(ISO_9899.Math.floor(Float.infinity) == Float.infinity)
            #expect(ISO_9899.Math.floor(-Float.infinity) == -Float.infinity)
            #expect(ISO_9899.Math.floor(Float.nan).isNaN)
        }
    }

    // MARK: - round() Tests

    @Suite
    struct `round() - Basic Functionality` {

        private static let `round to nearest, ties away from zero arguments`: [(Double, Double)] = [
            (2.3, 2.0),
            (2.5, 3.0),  // ties away from zero
            (2.7, 3.0),
            (2.0, 2.0),
            (-2.3, -2.0),
            (-2.5, -3.0),  // ties away from zero
            (-2.7, -3.0),
            (-2.0, -2.0),
            (0.4, 0.0),
            (0.5, 1.0),  // ties away from zero
            (0.6, 1.0),
            (-0.4, 0.0),
            (-0.5, -1.0),  // ties away from zero
            (-0.6, -1.0),
        ]

        @Test(arguments: Self.`round to nearest, ties away from zero arguments`)
        func `round to nearest, ties away from zero`(input: Double, expected: Double) {
            #expect(ISO_9899.Math.round(input) == expected)
        }

        @Test
        func `round of zero returns zero`() {
            #expect(ISO_9899.Math.round(0.0) == 0.0)
            #expect(ISO_9899.Math.round(-0.0) == -0.0)
        }

        @Test
        func `round preserves sign of zero`() {
            let positiveZero = ISO_9899.Math.round(0.0)
            let negativeZero = ISO_9899.Math.round(-0.0)
            #expect(positiveZero.sign == .plus)
            #expect(negativeZero.sign == .minus)
        }

        @Test
        func `round of infinity returns infinity`() {
            #expect(ISO_9899.Math.round(Double.infinity) == Double.infinity)
            #expect(ISO_9899.Math.round(-Double.infinity) == -Double.infinity)
        }

        @Test
        func `round of NaN returns NaN`() {
            #expect(ISO_9899.Math.round(Double.nan).isNaN)
        }

        @Test
        func `round of integer returns same integer`() {
            #expect(ISO_9899.Math.round(42.0) == 42.0)
            #expect(ISO_9899.Math.round(-17.0) == -17.0)
        }
    }

    @Suite
    struct `round() - Float Variant` {

        private static let `roundf to nearest, ties away from zero arguments`: [(Float, Float)] = [
            (Float(2.3), Float(2.0)),
            (Float(2.5), Float(3.0)),  // ties away from zero
            (Float(-2.3), Float(-2.0)),
            (Float(-2.5), Float(-3.0)),  // ties away from zero
        ]

        @Test(arguments: Self.`roundf to nearest, ties away from zero arguments`)
        func `roundf to nearest, ties away from zero`(input: Float, expected: Float) {
            #expect(ISO_9899.Math.round(input) == expected)
        }

        @Test
        func `roundf special values`() {
            #expect(ISO_9899.Math.round(Float(0.0)) == 0.0)
            #expect(ISO_9899.Math.round(Float.infinity) == Float.infinity)
            #expect(ISO_9899.Math.round(-Float.infinity) == -Float.infinity)
            #expect(ISO_9899.Math.round(Float.nan).isNaN)
        }
    }

    // MARK: - trunc() Tests

    @Suite
    struct `trunc() - Basic Functionality` {

        private static let `trunc rounds toward zero arguments`: [(Double, Double)] = [
            (2.3, 2.0),
            (2.9, 2.0),
            (2.0, 2.0),
            (-2.3, -2.0),
            (-2.9, -2.0),
            (-2.0, -2.0),
            (0.1, 0.0),
            (0.9, 0.0),
            (-0.1, 0.0),
            (-0.9, 0.0),
        ]

        @Test(arguments: Self.`trunc rounds toward zero arguments`)
        func `trunc rounds toward zero`(input: Double, expected: Double) {
            #expect(ISO_9899.Math.trunc(input) == expected)
        }

        @Test
        func `trunc of zero returns zero`() {
            #expect(ISO_9899.Math.trunc(0.0) == 0.0)
            #expect(ISO_9899.Math.trunc(-0.0) == -0.0)
        }

        @Test
        func `trunc preserves sign of zero`() {
            let positiveZero = ISO_9899.Math.trunc(0.0)
            let negativeZero = ISO_9899.Math.trunc(-0.0)
            #expect(positiveZero.sign == .plus)
            #expect(negativeZero.sign == .minus)
        }

        @Test
        func `trunc of infinity returns infinity`() {
            #expect(ISO_9899.Math.trunc(Double.infinity) == Double.infinity)
            #expect(ISO_9899.Math.trunc(-Double.infinity) == -Double.infinity)
        }

        @Test
        func `trunc of NaN returns NaN`() {
            #expect(ISO_9899.Math.trunc(Double.nan).isNaN)
        }

        @Test
        func `trunc of integer returns same integer`() {
            #expect(ISO_9899.Math.trunc(42.0) == 42.0)
            #expect(ISO_9899.Math.trunc(-17.0) == -17.0)
        }
    }

    @Suite
    struct `trunc() - Float Variant` {

        private static let `truncf rounds toward zero arguments`: [(Float, Float)] = [
            (Float(2.3), Float(2.0)),
            (Float(2.9), Float(2.0)),
            (Float(-2.3), Float(-2.0)),
            (Float(-2.9), Float(-2.0)),
        ]

        @Test(arguments: Self.`truncf rounds toward zero arguments`)
        func `truncf rounds toward zero`(input: Float, expected: Float) {
            #expect(ISO_9899.Math.trunc(input) == expected)
        }

        @Test
        func `truncf special values`() {
            #expect(ISO_9899.Math.trunc(Float(0.0)) == 0.0)
            #expect(ISO_9899.Math.trunc(Float.infinity) == Float.infinity)
            #expect(ISO_9899.Math.trunc(-Float.infinity) == -Float.infinity)
            #expect(ISO_9899.Math.trunc(Float.nan).isNaN)
        }
    }

    // MARK: - Comparative Tests

    @Suite
    struct `Rounding Function Relationships` {

        @Test
        func `ceil(x) >= floor(x) for all x`() {
            let testValues: [Double] = [2.3, -2.3, 0.5, -0.5, 42.0, -17.0]
            for value in testValues {
                #expect(ISO_9899.Math.ceil(value) >= ISO_9899.Math.floor(value))
            }
        }

        @Test
        func `for positive x, trunc(x) == floor(x)`() {
            let testValues: [Double] = [2.3, 2.9, 0.1, 0.9, 42.7]
            for value in testValues {
                #expect(ISO_9899.Math.trunc(value) == ISO_9899.Math.floor(value))
            }
        }

        @Test
        func `for negative x, trunc(x) == ceil(x)`() {
            let testValues: [Double] = [-2.3, -2.9, -0.1, -0.9, -42.7]
            for value in testValues {
                #expect(ISO_9899.Math.trunc(value) == ISO_9899.Math.ceil(value))
            }
        }

        @Test
        func `round differs from trunc on halfway values`() {
            // Positive halfway case
            #expect(ISO_9899.Math.round(2.5) != ISO_9899.Math.trunc(2.5))
            #expect(ISO_9899.Math.round(2.5) == 3.0)
            #expect(ISO_9899.Math.trunc(2.5) == 2.0)

            // Negative halfway case
            #expect(ISO_9899.Math.round(-2.5) != ISO_9899.Math.trunc(-2.5))
            #expect(ISO_9899.Math.round(-2.5) == -3.0)
            #expect(ISO_9899.Math.trunc(-2.5) == -2.0)
        }
    }

    // MARK: - Edge Cases

    @Suite
    struct `Rounding Edge Cases` {

        @Test
        func `very large values return themselves`() {
            let large = 1.0e15
            #expect(ISO_9899.Math.ceil(large) == large)
            #expect(ISO_9899.Math.floor(large) == large)
            #expect(ISO_9899.Math.round(large) == large)
            #expect(ISO_9899.Math.trunc(large) == large)
        }

        @Test
        func `very small positive values`() {
            let small = 1.0e-15
            #expect(ISO_9899.Math.ceil(small) == 1.0)
            #expect(ISO_9899.Math.floor(small) == 0.0)
            #expect(ISO_9899.Math.round(small) == 0.0)
            #expect(ISO_9899.Math.trunc(small) == 0.0)
        }

        @Test
        func `very small negative values`() {
            let small = -1.0e-15
            #expect(ISO_9899.Math.ceil(small) == 0.0)
            #expect(ISO_9899.Math.floor(small) == -1.0)
            #expect(ISO_9899.Math.round(small) == 0.0)
            #expect(ISO_9899.Math.trunc(small) == 0.0)
        }

        @Test
        func `values just below integer`() {
            let nearThree = 2.9999999999999996  // Just below 3.0
            #expect(ISO_9899.Math.ceil(nearThree) == 3.0)
            #expect(ISO_9899.Math.floor(nearThree) == 2.0)
        }

        @Test
        func `values just above integer`() {
            let justAboveThree = 3.0000000000000004  // Just above 3.0
            #expect(ISO_9899.Math.ceil(justAboveThree) == 4.0)
            #expect(ISO_9899.Math.floor(justAboveThree) == 3.0)
        }
    }
}
