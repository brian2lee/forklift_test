// Generated by gencpp from file ros_gazebo_gym/RLExperimentInfo.msg
// DO NOT EDIT!


#ifndef ROS_GAZEBO_GYM_MESSAGE_RLEXPERIMENTINFO_H
#define ROS_GAZEBO_GYM_MESSAGE_RLEXPERIMENTINFO_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ros_gazebo_gym
{
template <class ContainerAllocator>
struct RLExperimentInfo_
{
  typedef RLExperimentInfo_<ContainerAllocator> Type;

  RLExperimentInfo_()
    : episode_number(0)
    , step_number(0)
    , reward(0.0)  {
    }
  RLExperimentInfo_(const ContainerAllocator& _alloc)
    : episode_number(0)
    , step_number(0)
    , reward(0.0)  {
  (void)_alloc;
    }



   typedef int32_t _episode_number_type;
  _episode_number_type episode_number;

   typedef int32_t _step_number_type;
  _step_number_type step_number;

   typedef float _reward_type;
  _reward_type reward;





  typedef boost::shared_ptr< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> const> ConstPtr;

}; // struct RLExperimentInfo_

typedef ::ros_gazebo_gym::RLExperimentInfo_<std::allocator<void> > RLExperimentInfo;

typedef boost::shared_ptr< ::ros_gazebo_gym::RLExperimentInfo > RLExperimentInfoPtr;
typedef boost::shared_ptr< ::ros_gazebo_gym::RLExperimentInfo const> RLExperimentInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator1> & lhs, const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator2> & rhs)
{
  return lhs.episode_number == rhs.episode_number &&
    lhs.step_number == rhs.step_number &&
    lhs.reward == rhs.reward;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator1> & lhs, const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ros_gazebo_gym

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c19794b666c4451be032d9f41dd657c4";
  }

  static const char* value(const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc19794b666c4451bULL;
  static const uint64_t static_value2 = 0xe032d9f41dd657c4ULL;
};

template<class ContainerAllocator>
struct DataType< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ros_gazebo_gym/RLExperimentInfo";
  }

  static const char* value(const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# Message used to send training related information.\n"
"int32 episode_number\n"
"int32 step_number\n"
"float32 reward\n"
;
  }

  static const char* value(const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.episode_number);
      stream.next(m.step_number);
      stream.next(m.reward);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct RLExperimentInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ros_gazebo_gym::RLExperimentInfo_<ContainerAllocator>& v)
  {
    s << indent << "episode_number: ";
    Printer<int32_t>::stream(s, indent + "  ", v.episode_number);
    s << indent << "step_number: ";
    Printer<int32_t>::stream(s, indent + "  ", v.step_number);
    s << indent << "reward: ";
    Printer<float>::stream(s, indent + "  ", v.reward);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROS_GAZEBO_GYM_MESSAGE_RLEXPERIMENTINFO_H
