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

extension Array {
    func joined(_ map: (Element)->String, separator: String = "," ) -> String {
        var output: String = ""
        var flag = false
        for element in self {
            if flag {
                output.append(separator)
            } else {
                flag = true
            }
            output.append(map(element))
        }
        return output
    }
}

extension Array where Element: Describable {
    func joined() -> String {
        return joined({ (element) -> String in
            return element.description
        })
    }
}

extension Array where Element==ColumnResultConvertible {
    func joined() -> String {
        return joined({ (element) -> String in
            return element.asColumnResult().description
        })
    }
    
    func asColumnResults() -> [ColumnResult] {
        return self.map({ (element) -> ColumnResult in
            return element.asColumnResult()
        })
    }
}

extension Array where Element==ExpressionConvertible {
    func joined() -> String {
        return joined({ (element) -> String in
            return element.asExpression().description
        })
    }
    
    func asExpressions() -> [Expression] {
        return self.map({ (element) -> Expression in
            return element.asExpression()
        })
    }
}

extension Array where Element==ColumnConvertible {
    func joined() -> String {
        return joined({ (element) -> String in
            return element.asColumn().description
        })
    }
    
    func asColumns() -> [Column] {
        return self.map({ (element) -> Column in
            return element.asColumn()
        })
    }
}

extension Array where Element==TableOrSubqueryConvertible {
    func joined() -> String {
        return joined({ (element) -> String in
            return element.asTableOrSubquery().description
        })
    }
    
    func asTableOrSubqueryList() -> [Subquery] {
        return self.map({ (element) -> Subquery in
            return element.asTableOrSubquery()
        })
    }
}

extension Array where Element==OrderConvertible {
    func joined() -> String {
        return joined({ (element) -> String in
            return element.asOrder().description
        })
    }
    
    func asOrders() -> [Order] {
        return self.map({ (element) -> Order in
            return element.asOrder()
        })
    }
}

extension Array where Element==ColumnIndexConvertible {
    func joined() -> String {
        return joined({ (element) -> String in
            return element.asIndex().description
        })
    }
    
    func asIndexes() -> [ColumnIndex] {
        return self.map({ (element) -> ColumnIndex in
            return element.asIndex()
        })
    }
}

extension Array where Element==PropertyConvertible {
    func asProperties() -> [Property] {
        return self.map({ (element) -> Property in
            return element.asProperty()
        })
    }
}
