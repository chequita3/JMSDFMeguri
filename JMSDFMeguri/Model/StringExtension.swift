//
//  StringExtension.swift
//  
//
//  Created by 高山航輔 on 2022/06/07.
//

extension String {

    var lines: [String] {
        var lines = [String]()
        self.enumerateLines { (line, stop) -> () in
            lines.append(line)
        }
        return lines
    }

}
