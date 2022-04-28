//
//  Extension.swift
//  tuokeben-iOS
//
//  Created by dyw on 2022/4/25.
//

import Foundation
import UIKit

extension UITableView {
    // MARK: ---------------快捷注册及复用
    /// 注册xib Cell
    /// - Parameter cellClass: cell类
    func registerNibCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let idf = String(describing: cellClass)
        let nib = UINib(nibName: idf, bundle: nil)
        register(nib, forCellReuseIdentifier: idf)
    }
    
    /// 注册代码cell
    /// - Parameter cellClass: cell类
    func registerClassCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let idf = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: idf)
    }
    
    /// 复用cell
    /// - Parameter indexPath: cell位置
    /// - Returns: 对应类型的cell
    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath? = nil) -> T! {
        let idf = String(describing: T.self)
        guard let cell = indexPath == nil ? (dequeueReusableCell(withIdentifier: idf) as? T)
                : (dequeueReusableCell(withIdentifier: idf, for: indexPath!) as? T) else {
            fatalError("\(idf) 未注册")
        }
        return cell
    }
    
    /// 注册xib HeaderFooter
    /// - Parameter hfClass: HeaderFooter类
    func registerNibHeaderFooter<T: UIView>(_ hfClass: T.Type) {
        let idf = String(describing: hfClass)
        let nib = UINib(nibName: idf, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: idf)
    }
    
    /// 注册代码HeaderFooter
    /// - Parameter hfClass: HeaderFooter类
    func ts_registerClassHeaderFooter<T: UIView>(_ hfClass: T.Type) {
        let idf = String(describing: hfClass)
        register(hfClass, forHeaderFooterViewReuseIdentifier: idf)
    }
    
    /// 复用HeaderFooter
    /// - Parameter hfClass: HeaderFooter类
    /// - Returns: 对应类型的HeaderFooter
    func dequeueReusableHeaderFooter<T: UIView>(_ hfClass: T.Type) -> T! {
        let idf = String(describing: hfClass)
        guard let hfView = dequeueReusableHeaderFooterView(withIdentifier: idf) as? T else {
            fatalError("\(idf) 未注册")
        }
        return hfView
    }
}

extension UICollectionView {
    // MARK: ---------------快捷注册及复用
    /// 注册xib Cell
    /// - Parameter cellClass: cell类
    func registerNibCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        let idf = String(describing: cellClass)
        let nib = UINib(nibName: idf, bundle: nil)
        register(nib, forCellWithReuseIdentifier: idf)
    }
    
    /// 注册代码cell
    /// - Parameter cellClass: cell类
    func registerClassCell<T: UICollectionViewCell>(_ cellClass: T.Type) {
        let idf = String(describing: cellClass)
        register(cellClass, forCellWithReuseIdentifier: idf)
    }
    
    /// 复用cell
    /// - Parameter cellClass: cell类
    /// - Parameter indexPath: cell位置
    /// - Returns: 对应类型的cell
    func tdequeueReusableCell<T: UICollectionViewCell>(_ cellClass: T.Type, indexPath: IndexPath) -> T! {
        let idf = String(describing: cellClass)
        guard let cell = dequeueReusableCell(withReuseIdentifier: idf, for: indexPath) as? T else {
            fatalError("\(idf) 未注册")
        }
        return cell
    }
    
    /// 注册xib Header
    /// - Parameter hClass: Header类
    func registerNibHeader<T: UIView>(_ hClass: T.Type) {
        let idf = String(describing: hClass)
        let nib = UINib(nibName: idf, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: idf)
    }
    
    /// 注册xib Footer
    /// - Parameter fClass: Footer类
    func registerNibFooter<T: UIView>(_ fClass: T.Type) {
        let idf = String(describing: fClass)
        let nib = UINib(nibName: idf, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: idf)
    }
    
    /// 注册代码 Header
    /// - Parameter hClass: Header类
    func registerClassHeader<T: UIView>(_ hClass: T.Type) {
        let idf = String(describing: hClass)
        register(hClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: idf)
    }
    
    /// 注册代码 Footer
    /// - Parameter fClass: Footer类
    func registerClassFooter<T: UIView>(_ fClass: T.Type) {
        let idf = String(describing: fClass)
        register(fClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: idf)
    }
    
    /// 复用Header
    /// - Parameter hClass: Header类
    /// - Parameter indexPath: cell位置
    /// - Returns: 对应类型的Header
    func dequeueReusableHeader<T: UIView>(_ hClass: T.Type, indexPath: IndexPath) -> T! {
        let idf = String(describing: hClass)
        guard let hView = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: idf, for: indexPath) as? T else {
            fatalError("\(idf) 未注册")
        }
        return hView
    }
    
    /// 复用Header
    /// - Parameter fClass: Header类
    /// - Parameter indexPath: cell位置
    /// - Returns: 对应类型的Footer
    func dequeueReusableFooter<T: UIView>(_ fClass: T.Type, indexPath: IndexPath) -> T! {
        let idf = String(describing: fClass)
        guard let fView = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: idf, for: indexPath) as? T else {
            fatalError("\(idf) 未注册")
        }
        return fView
    }
}
