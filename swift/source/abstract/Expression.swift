/*
 * Tencent is pleased to support the open source community by making
 * WCDB available.
 *
 * Copyright (C) 2017 THL A29 Limited, a Tencent company.
 * All rights reserved.
 *
 * Licensed under the BSD 3-Clause License (the "License"); you may not use
 * this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 *       https://opensource.org/licenses/BSD-3-Clause
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

public final class Expression : Describable {
    public static let bindingParameter = Column(named: "?").asExpression()

    public init(with columnConvertible: ColumnConvertible) {
        super.init(columnConvertible.asColumn().description)
    }
    
    public init(with value: LiteralValue) {
        super.init(value.description)
    }
    
    public init(with statementSelect: StatementSelect) {
        super.init(statementSelect.description)
    }
    
    init(withRaw raw: String) {
        super.init(raw)
    }
    
    public convenience init(_ value: ()) {
        self.init(with: LiteralValue(value))
    }
    
    public convenience init(_ value: Bool) {
        self.init(with: LiteralValue(value))
    }
    
    public convenience init(_ value: Int) {
        self.init(with: LiteralValue(value))
    }
    
    public convenience init(_ value: Double) {
        self.init(with: LiteralValue(value))
    }
    
    public convenience override init(_ value: String) {
        self.init(with: LiteralValue(value))
    }
    
    public convenience init(_ value: Data) {
        self.init(with: LiteralValue(value))
    }
    
    public convenience init(_ value: Void?) {
        self.init(with: LiteralValue(value))
    }
    
    public convenience init<ColumnCodingType: ColumnCoding>(_ value: ColumnCodingType) {
        self.init(with: LiteralValue(value))
    }
}

extension Expression: ExpressibleByNilLiteral {
    public convenience init(nilLiteral value: ()) {
        self.init(with: LiteralValue(value))
    }
}
extension Expression: ExpressibleByBooleanLiteral {
    public convenience init(booleanLiteral value: Bool) {
        self.init(with: LiteralValue(value))
    }
}
extension Expression: ExpressibleByIntegerLiteral {
    public convenience init(integerLiteral value: Int) {
        self.init(with: LiteralValue(value))
    }
}
extension Expression: ExpressibleByFloatLiteral {
    public convenience init(floatLiteral value: Double) {
        self.init(with: LiteralValue(value))
    }
}
extension Expression: ExpressibleByStringLiteral {
    public convenience init(stringLiteral value: String) {
        self.init(with: LiteralValue(value))
    }
}

extension Expression : ExpressionOperable {
    public func asExpression() -> Expression {
        return self
    }
}
