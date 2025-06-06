import 'package:complycentre_app/features/business_management/domain/model/business.dart';
import 'package:complycentre_app/features/user_management/model/user_model.dart';

const List<String> roles = ['Cleaner', 'Supervisor'];

final List<UserModel> dummyUsers = [
  UserModel(
    name: 'Sonam khatri',
    email: 'sonam@gmail.com',
    role: 'Cleaner',
    isActive: true,
    avatarUrl: null,
  ),

  UserModel(
    name: 'Sonam khatri',
    email: 'sonam@gmail.com',
    role: 'Cleaner',
    isActive: true,
    avatarUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  UserModel(
    name: 'Vision Thapa',
    email: 'vision@gmail.com',
    role: 'Supervisor',
    isActive: false,
    avatarUrl:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  UserModel(
    name: 'Vision Thapa',
    email: 'vision@gmail.com',
    role: 'Supervisor',
    isActive: false,
    avatarUrl: null,
  ),
];

final List<UserModel> dummyAssignedUsers = [
  UserModel(
    name: 'Sonam khatri',
    email: 'sonam@gmail.com',
    role: 'Cleaner',
    isActive: true,
    avatarUrl: null,
  ),
  UserModel(
    name: 'Ronisha khadka',
    email: 'ronisha@gmail.com',
    role: 'Cleaner',
    isActive: false,
    avatarUrl: null,
  ),
  UserModel(
    name: 'Prem oli',
    email: 'prem@gmail.com',
    role: 'Cleaner',
    isActive: true,
    avatarUrl: null,
  ),
];

final List<Business> dummyBusinesses = [
  Business(
    officeName: 'Office name',
    address: 'Address',
    teamCount: 3,
    imageUrl: null,
  ),
  Business(
    officeName: 'Office name',
    address: 'Address',
    teamCount: 3,
    imageUrl: null,
  ),
  Business(
    officeName: 'Office name',
    address: 'Address',
    teamCount: 3,
    imageUrl: null,
  ),
  Business(
    officeName: 'Office name',
    address: 'Address',
    teamCount: 3,
    imageUrl: null,
  ),
  Business(
    officeName: 'Office name',
    address: 'Address',
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Business(
    officeName: 'Office name',
    address: 'Address',
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];

final List<Business> dummyAssignedBusinesses = [
  Business(
    officeName: 'Clean office',
    address: 'Address',
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  Business(
    officeName: 'Office name',
    address: 'Address',
    teamCount: 3,
    imageUrl:
        'https://images.unsplash.com/photo-1560493676-04071c5f467b?q=80&w=2864&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];
