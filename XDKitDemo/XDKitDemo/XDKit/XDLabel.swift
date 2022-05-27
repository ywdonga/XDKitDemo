//
//  XDLabel.swift
//  XDKitDemo
//
//  Created by dyw on 2022/5/27.
//

import UIKit

class XDLabel: UILabel {

    var contentEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero{
        didSet{
            setNeedsLayout()
        }
    }
    
    - (CGSize)sizeThatFits:(CGSize)size {
        size = [super sizeThatFits:CGSizeMake(size.width - UIEdgeInsetsGetHorizontalValue(self.contentEdgeInsets), size.height - UIEdgeInsetsGetVerticalValue(self.contentEdgeInsets))];
        size.width += UIEdgeInsetsGetHorizontalValue(self.contentEdgeInsets);
        size.height += UIEdgeInsetsGetVerticalValue(self.contentEdgeInsets);
        return size;
    }

    - (CGSize)intrinsicContentSize {
        CGFloat preferredMaxLayoutWidth = self.preferredMaxLayoutWidth;
        if (preferredMaxLayoutWidth <= 0) {
            preferredMaxLayoutWidth = CGFLOAT_MAX;
        }
        return [self sizeThatFits:CGSizeMake(preferredMaxLayoutWidth, CGFLOAT_MAX)];
    }

    - (void)layoutSubviews {
        [super layoutSubviews];
        if (self.truncatingTailView) {
            [self bringSubviewToFront:self.truncatingTailView];
            
            // 不能通过修改 numberOfLines = 0 再恢复它的值，来计算高度是否折叠了，因为修改它的值会触发 layout，从而陷入死循环，所以这里只能通过 NSAttributedString 来计算内容的实际高度。注意如果 lineBreakMode 为 Tail 的话，NSAttributedString 必定只能计算单行的高度，所以要手动改为非 Tail 的值
            CGSize limitSize = CGSizeMake(CGRectGetWidth(self.bounds) - UIEdgeInsetsGetHorizontalValue(self.contentEdgeInsets), CGFLOAT_MAX);
            NSMutableAttributedString *string = self.attributedText.mutableCopy;
            if (self.numberOfLines != 1 && self.lineBreakMode == NSLineBreakByTruncatingTail) {
                NSParagraphStyle *p = [string attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:nil];
                if (p) {
                    NSMutableParagraphStyle *mutableP = p.mutableCopy;
                    mutableP.lineBreakMode = NSLineBreakByWordWrapping;
                    [string addAttribute:NSParagraphStyleAttributeName value:mutableP range:NSMakeRange(0, string.length)];
                }
            }
            CGSize realSize = [string boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
            BOOL shouldShowTruncatingTailView = realSize.height > CGRectGetHeight(self.bounds);
            self.truncatingTailView.hidden = !shouldShowTruncatingTailView;
            if (!self.truncatingTailView.hidden) {
                CGFloat lineHeight = self.qmui_lineHeight;
                [self.truncatingTailView sizeToFit];
                self.truncatingTailView.frame = CGRectMake(CGRectGetWidth(self.bounds) - self.contentEdgeInsets.right - CGRectGetWidth(self.truncatingTailView.frame), CGRectGetHeight(self.bounds) - self.contentEdgeInsets.bottom - lineHeight, CGRectGetWidth(self.truncatingTailView.frame), lineHeight);
            }
        }
    }


    - (void)drawTextInRect:(CGRect)rect {
        rect = UIEdgeInsetsInsetRect(rect, self.contentEdgeInsets);
        
        // 在某些情况下文字位置错误，因此做了如下保护
        // https://github.com/Tencent/QMUI_iOS/issues/529
        if (self.numberOfLines == 1 && (self.lineBreakMode == NSLineBreakByWordWrapping || self.lineBreakMode == NSLineBreakByCharWrapping)) {
            rect = CGRectSetHeight(rect, CGRectGetHeight(rect) + self.contentEdgeInsets.top * 2);
        }
        
        [super drawTextInRect:rect];
    }


}

extension UIEdgeInsets{
 
    func getHorizontalValue() -> CGFloat {
        return left + right
    }
    
    func getVerticalValue() -> CGFloat {
        return top + bottom
    }
    
}
