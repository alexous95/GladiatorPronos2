//
//  User.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 10/11/2020.
//

import Foundation

struct User: Codable {
    let firstName, lastName, email, encryptedPassword: String
    let resetPasswordToken, resetPasswordSentAt, rememberCreatedAt: String
    let signInCount: Int
    let currentSignInAt, lastSignInAt, currentSignInIp, lastSignInIp: String
    let confirmationToken, confirmedAt, confirmationSentAt, unconfirmedEmail: String
    let failedAttemps: Int
    let unlockToken, lockedAt, createdAt, updatedAt: String
    let subscriptionExpireAt: String
    let admin: Bool
    let promotionCode: String
    let promotionPercent, promotionCashBack: Int
    let ipAdress: String
    let isPremium, isPremiumEsport: Bool
    let stripeId, stripeSubscriptionId: String
    let subscribed: Bool
    let currentPlan, cardLast4, cardExpMonth, cardExpYear: String
    let cardType, stripeToken: String
    let promotionExclusivity: Bool
}
