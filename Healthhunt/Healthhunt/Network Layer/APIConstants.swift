//
//  ConstantWebService.swift
//  Petbook
//
//  Created by ASPL on 03/09/16.
//  Copyright © 2016 ASPL. All rights reserved.
//

import Foundation

// Error Messsages
let kMessage_common = "Some Error Occurred"

// URL TAGS

enum URLTag {
    case login, registration, updatePhoto, forgot, homeList, SpProfile, jobStartRequest, jobRequestCancel, jobRequestListing, jobListing, jobInfo, jobStart, jobFinishRequest, jobFinish, filter, allMessages, viewMessage, sendMessage, userProfile, editProfile, messageDesctruction, changePassword, changeEmail, changeMobileNumber, getPage, createPost, editpost, deletePost, postListing, viewPost, addSPInfo, listMyPosts, SPFormInfo, getCities, ClientProfile, myWallet, addWalletAmount, saveCard, myCard, removeCard, feedback, updateProfile, requestpayment
}

struct AppURL {
    static let base = "fancynancy.katsofttechnology.com/api/v1/"

    static let login = "login"
    static let registration = "register"
    static let updatePhoto = "uploadProfileImage"
    static let forgot = "forgot"

    static let homeList = "homeListing"
    static let SpProfile = "SpProfile"

    static let jobStartRequest = "jobStartRequest"
    static let jobRequestCancel = "jobRequestCancel"
    static let jobRequestListing = "jobRequestListing"
    static let jobListing = "jobListing"

    static let jobInfo = "jobInfo"
    static let jobStart = "jobStart"
    static let jobFinishRequest = "jobFinishRequest"
    static let jobFinish = "jobFinish"

    static let filter = "filter"
    static let feedback = "feedbacks"

    static let allMessages = "allMessages"
    static let viewMessage = "viewMessage"
    static let sendMessage = "sendMessage"

    static let userProfile = "userProfile"
    static let editProfile = "editProfile"
    static let updateProfile = "updateProfile"

    static let messageDesctruction = "messageDesctruction"
    static let changePassword = "changePassword"
    static let changeEmail = "changeEmail"
    static let changeMobileNumber = "changeMobileNumber"

    /*
        privacy policy     =>  page_id = 1
        Terms of Services  =>  page_id = 2
 */

    static let getPage = "getPage"

    static let createPost = "createPost"
    static let editpost = "editpost"
    static let deletePost = "deletePost"

    static let postListing = "postListing"
    static let viewPost = "viewPost"

    static let addSPInfo = "addSPInfo"
    static let listMyPosts  = "listMyPosts"

    static let SPFormInfo = "SPFormInfo"
    static let getCities = "getCities"
    static let ClientProfile = "ClientProfile"
    static let myWallet = "myWallet"
    static let addWalletAmount = "addWalletAmount"
    static let saveCard = "saveCard"
    static let myCard = "myCard"
    static let removeCard = "removeCard"
    static let requestpayment = "requestpayment"

}
